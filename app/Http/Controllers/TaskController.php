<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Controller;

class TaskController extends Controller
{
    public function dashboard()
    {
        $user = auth()->user();

        $totalTasks = Task::where('user_id', $user->id)->count();
        $assignedTasks = Task::where('user_id', $user->id)->count();
        $completedTasks = Task::where('user_id', $user->id)->where('status', 'completed')->count();

        return view('tasks.dashboard', compact('totalTasks', 'assignedTasks', 'completedTasks'));
    }

    public function index(Request $request)
    {
        $status = $request->input('status', 'todo');
        $tasks = Task::where('status', $status);

        if (Auth::user()->hasRole('admin')) {
            $tasks = $tasks->paginate(10);
        } else {
            $tasks = $tasks->where('user_id', Auth::id())->paginate(10);
        }

        return view('tasks.index', compact('tasks', 'status'));
    }

    public function create()
    {
        if (!Auth::user()->hasPermission('create task')) {
            return abort(403, 'Unauthorized action.');
        }

        return view('tasks.create');
    }

    public function store(Request $request)
    {
        if (!Auth::user()->hasPermission('create task')) {
            return abort(403, 'Unauthorized action.');
        }

        $request->validate([
            'title' => 'required|max:255',
            'description' => 'required',
            'status' => 'required|in:todo,in-progress,done',
            'priority' => 'required|in:high,medium,low',
            'due_date' => 'nullable|date|after_or_equal:today',
            'file' => 'nullable|file|mimes:pdf,jpg,png,docx|max:10240',
        ]);

        $task = new Task();
        $task->user_id = Auth::id();
        $task->title = $request->title;
        $task->description = $request->description;
        $task->status = $request->status;
        $task->priority = $request->priority;
        $task->due_date = $request->due_date;

        if ($request->hasFile('file')) {
            $path = $request->file('file')->store('task_files');
            $task->file_path = $path;
        }

        $task->save();

        return redirect()->route('tasks.index')->with('success', 'Task created successfully');
    }

    public function edit(Task $task)
    {
        if (!Auth::user()->hasPermission('edit task') || 
            (!Auth::user()->hasRole('admin') && !Auth::user()->hasRole('manager') && $task->user_id != Auth::id())) {
            return abort(403, 'Unauthorized action.');
        }

        if ($task->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }
        return view('tasks.edit', compact('task'));
    }

    public function update(Request $request, Task $task)
    {
        if (!Auth::user()->hasPermission('edit task') || 
            (!Auth::user()->hasRole('admin') && !Auth::user()->hasRole('manager') && $task->user_id != Auth::id())) {
            return abort(403, 'Unauthorized action.');
        }

        if ($task->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }

        $request->validate([
            'title' => 'required|max:255',
            'description' => 'required',
            'status' => 'required|in:todo,in-progress,done',
            'priority' => 'required|in:high,medium,low',
            'due_date' => 'nullable|date|after_or_equal:today',
            'file' => 'nullable|file|mimes:pdf,jpg,png,docx|max:10240',
        ]);

        $task->update([
            'title' => $request->title,
            'description' => $request->description,
            'status' => $request->status,
            'priority' => $request->priority,
            'due_date' => $request->due_date,
        ]);

        if ($request->hasFile('file')) {
            if ($task->file_path) {
                Storage::delete($task->file_path);
            }
            $path = $request->file('file')->store('task_files');
            $task->file_path = $path;
        }

        $task->save();

        return redirect()->route('tasks.index')->with('success', 'Task updated successfully');
    }

    public function archive(Task $task)
    {
        if (!Auth::user()->hasPermission('archive task') || 
            (!Auth::user()->hasRole('admin') && !Auth::user()->hasRole('manager') && $task->user_id != Auth::id())) {
            return abort(403, 'Unauthorized action.');
        }

        if ($task->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }

        $task->status = 'done';
        $task->save();

        return redirect()->route('tasks.index')->with('success', 'Task archived successfully');
    }

    public function restore(Task $task)
    {
        if (!Auth::user()->hasPermission('restore task') || 
            (!Auth::user()->hasRole('admin') && !Auth::user()->hasRole('manager') && $task->user_id != Auth::id())) {
            return abort(403, 'Unauthorized action.');
        }

        if ($task->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }

        $task->status = 'todo';
        $task->save();

        return redirect()->route('tasks.index')->with('success', 'Task restored successfully');
    }

    public function destroy(Task $task)
    {
        if (!Auth::user()->hasPermission('delete task') || 
            (!Auth::user()->hasRole('admin') && !Auth::user()->hasRole('manager') && $task->user_id != Auth::id())) {
            return abort(403, 'Unauthorized action.');
        }
        
        if ($task->user_id != Auth::id()) {
            return abort(403, 'Unauthorized action.');
        }

        if ($task->file_path) {
            Storage::delete($task->file_path);
        }

        $task->delete();

        return redirect()->route('tasks.index')->with('success', 'Task deleted successfully');
    }
}
