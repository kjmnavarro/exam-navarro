<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Task;
use Livewire\WithFileUploads;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

#[Layout('layouts.app')]
class TaskManager extends Component
{
    use WithPagination, WithFileUploads;

    public $title, $description, $status = 'todo', $priority, $due_date, $file, $taskId;
    public $filterStatus = 'todo';

    protected $paginationTheme = 'bootstrap';

    protected $rules = [
        'title' => 'required|string|max:255',
        'description' => 'required|string',
        'status' => 'required|in:todo,in-progress,done',
        'priority' => 'required|in:high,medium,low',
        'due_date' => 'required|date',
        'file' => 'nullable|file|mimes:jpg,png,pdf,docx,zip|max:2048',
    ];

    public function render()
    {
        $tasks = Task::where('user_id', Auth::id())
            ->when($this->filterStatus, function ($query) {
                return $query->where('status', $this->filterStatus);
            })
            ->paginate(10);

        return view('livewire.task-manager', compact('tasks'));
    }

    public function saveTask()
    {
        $this->validate();

        $filePath = null;
        if ($this->file) {
            $filePath = $this->file->store('tasks_files', 'public');
        }

        Task::updateOrCreate(
            ['id' => $this->taskId],
            [
                'title' => $this->title,
                'description' => $this->description,
                'status' => $this->status,
                'priority' => $this->priority,
                'due_date' => $this->due_date,
                'user_id' => Auth::id(),
                'file_path' => $filePath,
            ]
        );

        session()->flash('message', $this->taskId ? 'Task updated successfully.' : 'Task created successfully.');
        $this->resetFields();
    }

    public function editTask($taskId)
    {
        $task = Task::find($taskId);

        if ($task) {
            $this->taskId = $task->id;
            $this->title = $task->title;
            $this->description = $task->description;
            $this->status = $task->status;
            $this->priority = $task->priority;
            $this->due_date = $task->due_date;
        }
    }

    public function deleteTask($taskId)
    {
        $task = Task::find($taskId);

        if ($task) {
            if ($task->file_path) {
                Storage::disk('public')->delete($task->file_path);
            }
            $task->delete();
            session()->flash('message', 'Task deleted successfully.');
        }
    }

    public function resetFields()
    {
        $this->taskId = null;
        $this->title = '';
        $this->description = '';
        $this->status = 'todo';
        $this->priority = '';
        $this->due_date = '';
        $this->file = null;
    }
}
