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
                        <div class="flex justify-between items-center mb-6">
                            <h1 class="text-3xl font-semibold">Your Tasks</h1>
                            <a href="{{ route('tasks.create') }}" class="bg-blue-500 text-white py-2 px-4 rounded-md">
                                Create New Task
                            </a>
                        </div>                        
                    
                        <form method="GET" action="{{ route('tasks.index') }}" class="mb-4">
                            <select name="status" onchange="this.form.submit()" class="bg-gray-800 text-white py-2 px-4 rounded-md">
                                <option value="todo" @selected($status == 'todo')>Todo</option>
                                <option value="in-progress" @selected($status == 'in-progress')>In Progress</option>
                                <option value="done" @selected($status == 'done')>Done</option>
                            </select>
                        </form>
                    
                        @if($tasks->count())
                            <div class="space-y-4">
                                @foreach ($tasks as $task)
                                    <div class="bg-dark shadow-lg rounded-lg p-4 space-y-1">
                                        <h5 class="text-xl font-semibold">{{ $task->title }}</h5>
                                        <p>{{ $task->description }}</p>
                                        <p><strong>Status:</strong> {{ ucfirst($task->status) }}</p>
                                        <p><strong>Priority:</strong> {{ ucfirst($task->priority) }}</p>
                                        <p><strong>Due Date:</strong> {{ \Carbon\Carbon::parse($task->due_date)->format('Y-m-d') ?? 'N/A' }}</p>
                                        <a href="{{ route('tasks.edit', $task) }}" class="bg-blue-500 text-white py-1 px-3 rounded-md text-sm inline-block">Edit</a>
                    
                                        @if($task->status === 'done' && (Auth::user()->hasRole('admin') || Auth::user()->hasRole('manager') || !Auth::user()->hasRole('user')))
                                            <form action="{{ route('tasks.restore', $task) }}" method="POST" class="d-inline">
                                                @csrf
                                                <button type="submit" class="bg-green-500 text-white py-1 px-3 rounded-md text-sm inline-block">Restore</button>
                                            </form>
                                        @endif
                    
                                        <hr class="my-4">
                                    </div>
                                @endforeach
                            </div>
                    
                            <div class="mt-6">
                                {{ $tasks->links() }}
                            </div>
                        @else
                            <p>No tasks found.</p>
                        @endif
                    </div>                    
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
