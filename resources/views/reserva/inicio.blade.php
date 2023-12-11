@extends('base.app')

@section('titulo', 'Listagem de reservas')

@section('content')

    <!doctype html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
            integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            clifford: '#da373d',
                        }
                    }
                }
            }
        </script>
        <style>
            html {
                height: 100%;
                box-sizing: border-box;
            }

            body {
                position: relative;
                margin: 0;
                min-height: 100%;
                padding-bottom: 6rem;
                box-sizing: inherit;
            }

            footer {
                position: fixed;
                right: 0;
                left: 0;
                bottom: 0;

            }
        </style>
        <title>@yield('titulo') SportsFind</title>
    </head>

    <h3 class="pt-4 text-4xl font-medium text-center mb-4">SportsFind</h3>

    <div class="font-medium flex flex-col w-3/4 mr-auto ml-auto h-full">
        <div>
            <h3 class="text-black-700">Em qualquer lugar, a qualquer hora</h3>
            <img class="w-full" src="https://www.grangehotels.com/media/4250/1-grange-white-hall-hotel-1920x900.jpg" />
        </div>
    </div>


    </html>
@endsection
