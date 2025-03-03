<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Role;
use App\Models\Permission;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $adminRole = Role::where('name', 'admin')->first();
        $managerRole = Role::where('name', 'manager')->first();
        $userRole = Role::where('name', 'user')->first();

        $createTaskPermission = Permission::where('name', 'create task')->first();
        $assignTaskPermission = Permission::where('name', 'edit task')->first();
        $deleteTaskPermission = Permission::where('name', 'delete task')->first();
        $viewTaskPermission = Permission::where('name', 'view task')->first();

        $adminRole->permissions()->attach([
            $createTaskPermission->id,
            $assignTaskPermission->id,
            $deleteTaskPermission->id,
            $viewTaskPermission->id,
        ]);

        $managerRole->permissions()->attach([
            $createTaskPermission->id,
            $assignTaskPermission->id,
            $viewTaskPermission->id,
        ]);

        $userRole->permissions()->attach([
            $createTaskPermission->id,
            $viewTaskPermission->id,
        ]);

        $admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
        ]);
        $admin->roles()->attach($adminRole);

        $manager = User::create([
            'name' => 'Manager User',
            'email' => 'manager@example.com',
            'password' => Hash::make('password'),
        ]);
        $manager->roles()->attach($managerRole);

        $user = User::create([
            'name' => 'Regular User',
            'email' => 'user@example.com',
            'password' => Hash::make('password'),
        ]);
        $user->roles()->attach($userRole);
    }
}
