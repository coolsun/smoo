<template>
    <section class="breadcrumb-area darkest-overlay" style="background: url('assets/images/hero.jpg') no-repeat center / cover;">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12">
                    <div class="banner-title">
                        <h2>{{ $t('header.start-a-project') }}</h2>
                    </div>
                    <div class="page-breadcrumb">
                        <ul>
                            <li><a href="/">{{ $t('header.101moo') }}</a></li>
                            <li>{{ $t('header.' + $route.name ) }}</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>