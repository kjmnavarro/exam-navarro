<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Task Page') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <div class="container mx-auto p-4">
                        <h1 class="text-xl font-semibold mb-4">Edit Task: {{ $task->title }}</h1>
                    
                        <form action="{{ route('tasks.update', $task) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                    
                            <div class="mb-4">
                                <label for="title" class="block text-sm font-medium mb-2">Title</label>
                                <input type="text" name="title" id="title" class="text-black w-full p-2 border border-gray-300 rounded-md" value="{{ old('title', $task->title) }}" required>
                                @error('title') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="description" class="block text-sm font-medium mb-2">Description</label>
                                <textarea name="description" id="description" class="text-black w-full p-2 border border-gray-300 rounded-md" required>{{ old('description', $task->description) }}</textarea>
                                @error('description') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="status" class="block text-sm font-medium mb-2">Status</label>
                                <select name="status" id="status" class="text-black w-full p-2 border border-gray-300 rounded-md" required>
                                    <option value="todo" @selected(old('status', $task->status) == 'todo')>Todo</option>
                                    <option value="in-progress" @selected(old('status', $task->status) == 'in-progress')>In Progress</option>
                                    <option value="done" @selected(old('status', $task->status) == 'done')>Done</option>
                                </select>
                                @error('status') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="priority" class="block text-sm font-medium mb-2">Priority</label>
                                <select name="priority" id="priority" class="text-black w-full p-2 border border-gray-300 rounded-md" required>
                                    <option value="high" @selected(old('priority', $task->priority) == 'high')>High</option>
                                    <option value="medium" @selected(old('priority', $task->priority) == 'medium')>Medium</option>
                                    <option value="low" @selected(old('priority', $task->priority) == 'low')>Low</option>
                                </select>
                                @error('priority') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="due_date" class="block text-sm font-medium mb-2">Due Date</label>
                                <input type="date" name="due_date" id="due_date" class="text-black w-full p-2 border border-gray-300 rounded-md" value="{{ old('due_date', \Carbon\Carbon::parse($task->due_date)->format('Y-m-d') ?? 'N/A') }}">
                                @error('due_date') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="file" class="block text-sm font-medium mb-2">Attach a New File (Optional)</label>
                                <input type="file" name="file" id="file" class="w-full p-2 border border-gray-300 rounded-md">
                                @error('file') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            @if($task->file_path)
                                <div class="mb-4">
                                    <a href="{{ Storage::url($task->file_path) }}" target="_blank" class="text-blue-500">View Current File</a>
                                </div>
                            @endif
                    
                            <button type="submit" class="w-full bg-blue-500 text-white p-2 rounded-md">Update Task</button>
                        </form>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</x-app-layout>