<?php

namespace AuctionLook\DockerForForge;

use AuctionLook\DockerForForge\Commands\InstallCommand;
use Illuminate\Support\ServiceProvider;

class DockerForForgeServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            InstallCommand::class,
        ]);
    }
}
