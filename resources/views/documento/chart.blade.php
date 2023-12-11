@extends('base.app')

@section('titulo', 'Formulário de Espaco')

@section('content')

    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Chart Sample</title>
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    </head>

    <body class="bg-neutral-600">

        <div class="container px-4 mx-auto pb-6">

            <div class="p-6 m-20 bg-white rounded shadow">
                {!! $chart->container() !!}
            </div>

        </div>

        <script src="{{ $chart->cdn() }}"></script>

        {{ $chart->script() }}
    </body>

    </html>
@endsection
