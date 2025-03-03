<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\Task;
use App\Models\User;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // Register any policies if necessary
        // Task::class => TaskPolicy::class,
    ];

    /**
     * Register any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('create-task', function (User $user) {
            return $user->hasRole('admin') || $user->hasRole('manager') || $user->hasRole('user');
        });

        Gate::define('edit-task', function (User $user, Task $task) {
            return $user->hasRole('admin') || $user->hasRole('manager') || $user->id === $task->user_id;
        });

        Gate::define('archive-task', function (User $user, Task $task) {
            return $user->hasRole('admin') || $user->hasRole('manager') || $user->id === $task->user_id;
        });

        Gate::define('restore-task', function (User $user, Task $task) {
            return $user->hasRole('admin') || $user->hasRole('manager') || $user->id === $task->user_id;
        });

        Gate::define('delete-task', function (User $user, Task $task) {
            return $user->hasRole('admin') || $user->hasRole('manager') || $user->id === $task->user_id;
        });
    }
}
