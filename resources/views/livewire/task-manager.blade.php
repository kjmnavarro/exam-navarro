<div>
    <!-- Flash message for task creation/updation/deletion -->
    @if (session()->has('message'))
        <div class="alert alert-success">
            {{ session('message') }}
        </div>
    @endif

    <!-- Filter Tasks -->
    <div class="mb-4">
        <select wire:model="filterStatus" class="form-select">
            <option value="todo">To Do</option>
            <option value="in-progress">In Progress</option>
            <option value="done">Done</option>
        </select>
    </div>

    <!-- Task List -->
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Priority</th>
                <th>Due Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($tasks as $task)
                <tr>
                    <td>{{ $task->title }}</td>
                    <td>{{ $task->description }}</td>
                    <td>{{ ucfirst($task->status) }}</td>
                    <td>{{ ucfirst($task->priority) }}</td>
                    <td>{{ \Carbon\Carbon::parse($task->due_date)->format('d M Y') }}</td>
                    <td>
                        <button wire:click="editTask({{ $task->id }})" class="btn btn-primary">Edit</button>
                        <button wire:click="deleteTask({{ $task->id }})" class="btn btn-danger">Delete</button>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <!-- Pagination -->
    <div class="mt-4">
        {{ $tasks->links() }}
    </div>

    <!-- Task Form -->
    <div class="mt-6">
        <h3>{{ $taskId ? 'Edit Task' : 'Create Task' }}</h3>

        <form wire:submit.prevent="saveTask">
            <div class="form-group">
                <label for="title">Task Title</label>
                <input wire:model="title" type="text" id="title" class="form-control" required>
                @error('title') <span class="text-danger">{{ $message }}</span> @enderror
            </div>

            <div class="form-group mt-3">
                <label for="description">Task Description</label>
                <textarea wire:model="description" id="description" class="form-control" required></textarea>
                @error('description') <span class="text-danger">{{ $message }}</span> @enderror
            </div>

            <div class="form-group mt-3">
                <label for="status">Task Status</label>
                <select wire:model="status" id="status" class="form-control" required>
                    <option value="todo">To Do</option>
                    <option value="in-progress">In Progress</option>
                    <option value="done">Done</option>
                </select>
                @error('status') <span class="text-danger">{{ $message }}</span> @enderror
            </div>

            <div class="form-group mt-3">
                <label for="priority">Priority</label>
                <select wire:model="priority" id="priority" class="form-control" required>
                    <option value="high">High</option>
                    <option value="medium">Medium</option>
                    <option value="low">Low</option>
                </select>
                @error('priority') <span class="text-danger">{{ $message }}</span> @enderror
            </div>

            <div class="form-group mt-3">
                <label for="due_date">Due Date</label>
                <input wire:model="due_date" type="date" id="due_date" class="form-control" required>
                @error('due_date') <span class="text-danger">{{ $message }}</span> @enderror
            </div>

            <div class="form-group mt-3">
                <label for="file">Upload File</label>
                <input wire:model="file" type="file" id="file" class="form-control">
                @error('file') <span class="text-danger">{{ $message }}</span> @enderror
            </div>

            <button type="submit" class="btn btn-success mt-3">
                {{ $taskId ? 'Update Task' : 'Create Task' }}
            </button>
        </form>
    </div>
</div>