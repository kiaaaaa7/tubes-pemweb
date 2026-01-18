<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //user
        Permission::create(['name' => 'tambah-user']);
        Permission::create(['name' => 'edit-user']);
        Permission::create(['name' => 'hapus-user']);
        Permission::create(['name' => 'lihat-user']);

        //berita
        Permission::create(['name' => 'tambah-berita']);
        Permission::create(['name' => 'edit-berita']);
        Permission::create(['name' => 'hapus-berita']);
        Permission::create(['name' => 'lihat-berita']);

        //buat role
        Role::create(['name' => 'admin']);
        Role::create(['name' => 'user']);

        //permission role
        $roleAdmin = Role::findByName('admin');
        $roleAdmin->givePermissionTo('tambah-user');
        $roleAdmin->givePermissionTo('edit-user');
        $roleAdmin->givePermissionTo('hapus-user');
        $roleAdmin->givePermissionTo('lihat-user');

        $roleUser = Role::findByName('user');
        $roleUser->givePermissionTo('tambah-berita');
        $roleUser->givePermissionTo('edit-berita');
        $roleUser->givePermissionTo('hapus-berita');
        $roleUser->givePermissionTo('lihat-berita');

    }
}
