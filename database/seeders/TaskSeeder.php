<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Task;
use App\Models\User;
use Faker\Factory as Faker;
use Illuminate\Support\Str;

class TaskSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();
        $users = User::all();

        foreach ($users as $user) {
            $numOfTasks = rand(1, 10);

            for ($i = 0; $i < $numOfTasks; $i++) {
                Task::create([
                    'title' => $faker->sentence,
                    'description' => $faker->paragraph,
                    'status' => $faker->randomElement(['todo', 'in-progress', 'done']),
                    'priority' => $faker->randomElement(['high', 'medium', 'low']),
                    'due_date' => $faker->date(),
                    'file_path' => $faker->optional()->filePath(),
                    'user_id' => $user->id,
                    'archived' => $faker->boolean(10),
                ]);
            }
        }
    }
}
