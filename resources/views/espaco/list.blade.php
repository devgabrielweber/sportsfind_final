@extends('base.app')

@section('titulo', 'Listagem de espaços')

@section('content')

    <h3 class="pt-4 text-4xl font-medium text-center mb-4">Listagem de espaços</h3>
    <div
        class="block w-3/4 flex mr-auto ml-auto space-x-3 rounded-lg bg-white p-6 dark:bg-neutral-600 lg:px-8 justify-center align-center">

        <form action="{{ route('espaco.search') }}" method="post">
            @csrf
            <!-- cria um hash de segurança -->
            <div class="grid grid-cols-3 gap-6 flex space-x-4">

                <!--First name input-->
                <div class="relative mb-6" data-te-input-wrapper-init>
                    <select name="tipo"
                        class="mt-0 block w-full px-0.5 border-0 border-b-2
                            border-green-700 border-opacity-30  bg-neutral-700 text-gray-200
                        ">
                        <option value="nome">Nome</option>
                        <option value="esporte">Esporte</option>
                        <option value="valorHora">Valor Hora</option>
                    </select>
                </div>
                <!--Last name input-->
                <div class="relative mb-6" data-te-input-wrapper-init>
                    <input
                        class="mt-0 block w-full px-0.5 border-0 border-b-2
                        border-green-700 border-opacity-30  bg-neutral-700 text-gray-200
                "
                        type="text" name="valor" placeholder="Pesquisar">
                </div>
                <!--Submit button-->
                <div class="relative mb-6 d-flex">
                    <button type="submit"
                        class="bg-blue-500 hover:bg-blue-600 text-white
                            font-semibold py-2 px-4 rounded focus:outline
                            focus:ring focus:border-blue-300"
                        data-te-ripple-init data-te-ripple-color="light">
                        <i class="fa-solid fa-magnifying-glass"></i> Buscar
                    </button>
                    <a class="bg-green-500 hover:bg-green-600 text-white
                                font-semibold py-2 px-4 rounded focus:outline
                                focus:ring focus:border-green-300"
                        href="{{ route('espaco.create') }}">
                        <i class="fa-solid fa-plus"></i>
                        Cadastrar</a><br>

                    <div class="row pt-2 d-flex pl-10">
                        <div>
                            <a class="bg-blue-500 hover:bg-blue-600 text-white
                        font-semibold py-2 px-4 rounded focus:outline
                        focus:ring focus:border-green-300"
                                href="{{ route('espaco.relatorio') }}">
                                <i class="fa-solid fa-plus"></i>
                                Gerar Relatório</a><br>
                        </div>
                        <div class="pt-3">
                            <a class="bg-blue-500 hover:bg-blue-600 text-white
                            font-semibold py-2 px-4 rounded focus:outline
                            focus:ring focus:border-green-300"
                                href="{{ route('espaco.chart') }}">
                                <i class="fa-solid fa-plus"></i>
                                Gerar Gráfico</a><br>
                        </div>
                    </div>

                </div>
            </div>

        </form>
    </div>

    <div class="flex flex-col w-3/4 mr-auto ml-auto">
        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
                <div class="overflow-hidden">
                    <table class="min-w-full text-left text-sm font-light">
                        <thead class="border-b font-medium dark:border-neutral-500">
                            <tr>
                                <th scope="col" class="px-6 py-4">Nome</th>
                                <th scope="col" class="px-6 py-4">Esporte</th>
                                <th scope="col" class="px-6 py-4">Valor Hora</th>
                                <th scope="col" class="px-6 py-4"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($espacos as $item)
                                <tr class="border-b transition duration-300 ease-in-out hover:bg-neutral-700">
                                    <td class="whitespace-nowrap px-6 py-4 font-medium">{{ $item->nome ?? '' }}</td>
                                    <td class="whitespace-nowrap px-6 py-4 font-medium">{{ $item->esporte ?? '' }}</td>
                                    <td class="whitespace-nowrap px-6 py-4 font-medium">{{ $item->valorHora ?? '' }}</td>
                                    <td class="whitespace-nowrap px-6 py-4"><a
                                            href="{{ route('espaco.detalhes', $item->id) }}"
                                            class="bg-green-500 hover:bg-green-600 text-white
                            font-semibold py-2 px-4 rounded focus:outline
                            focus:ring focus:border-green-300"><i
                                                class="fa-solid fa-magnifying-glass" style="color: white;"></i> Ver
                                            Detalhes</a></td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
@endsection
