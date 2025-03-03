<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ config('app.name', 'Laravel') }}</title>

    @livewireStyles
    <!-- Add other stylesheets here -->
</head>
<body class="bg-gray-100">
    <div class="container mx-auto">
        <header>
            <!-- You can put a navbar or header here -->
            <nav class="bg-white p-4 shadow-md">
                <ul class="flex space-x-4">
                    <li><a href="{{ route('dashboard') }}" class="text-blue-600">Dashboard</a></li>
                    <li><a href="{{ route('tasks.index') }}" class="text-blue-600">Tasks</a></li>
                    <!-- Add more links here -->
                </ul>
            </nav>
        </header>

        <main class="py-8">
            @yield('content')  <!-- This will be replaced by content in the child view -->
        </main>

        <footer class="bg-white p-4 shadow-md">
            <p>&copy; {{ date('Y') }} Your Company. All rights reserved.</p>
        </footer>
    </div>

    @livewireScripts
</body>
</html>
