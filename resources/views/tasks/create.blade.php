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
                    <div class="container mx-auto p-6">
                        <h1 class="text-3xl font-semibold mb-6">Create Task</h1>
                    
                        <form action="{{ route('tasks.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                    
                            <div class="mb-4">
                                <label for="title" class="block text-sm font-medium">Title</label>
                                <input type="text" name="title" id="title" class="text-black mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('title') }}" required>
                                @error('title') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="description" class="block text-sm font-medium">Description</label>
                                <textarea name="description" id="description" class="text-black mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>{{ old('description') }}</textarea>
                                @error('description') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="status" class="block text-sm font-medium">Status</label>
                                <select name="status" id="status" class="text-black mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                                    <option value="todo" @selected(old('status') == 'todo')>Todo</option>
                                    <option value="in-progress" @selected(old('status') == 'in-progress')>In Progress</option>
                                    <option value="done" @selected(old('status') == 'done')>Done</option>
                                </select>
                                @error('status') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="priority" class="block text-sm font-medium">Priority</label>
                                <select name="priority" id="priority" class="text-black mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                                    <option value="high" @selected(old('priority') == 'high')>High</option>
                                    <option value="medium" @selected(old('priority') == 'medium')>Medium</option>
                                    <option value="low" @selected(old('priority') == 'low')>Low</option>
                                </select>
                                @error('priority') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="due_date" class="block text-sm font-medium">Due Date</label>
                                <input type="date" name="due_date" id="due_date" class="text-black mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('due_date') }}">
                                @error('due_date') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <div class="mb-4">
                                <label for="file" class="block text-sm font-medium">Attach a File</label>
                                <input type="file" name="file" id="file" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500">
                                @error('file') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
                            </div>
                    
                            <button type="submit" class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500">Create Task</button>
                        </form>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
