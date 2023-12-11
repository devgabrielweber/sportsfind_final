<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Documentos;
use App\Models\Espaco;
use App\Http\Requests\clienteStoreRequest;
use App\Http\Requests\clienteUpdateRequest;
use App\Models\Documento;
use App\Models\Reserva;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

use Barryvdh\DomPDF\Facade\Pdf;

class clienteController extends Controller
{

    public function gerarPDF()
    {
        // Recupere dados do banco de dados
        $clientes = Cliente::all();
    
        // Carregue a visualização com os dados
        $pdf = PDF::loadView('cliente.relatorio', compact('clientes'))->setOptions(['defaultFont' => 'sans-serif']);
    
        // Faça o download do PDF ou exiba no navegador
        return $pdf->download('relatorio.pdf');
    }

    public function index(Request $request): View
    {
        $clientes = Cliente::all();

        return view('cliente.list')->with('clientes', $clientes);
    }

    public function create(Request $request): View
    {
        $documentos = Documento::orderBy('titular')->get();
        return view('cliente.form')->with('documentos',$documentos);
    }

    public function store(Request $request)
    {

        $request->validate([
            'nome'=>'required',
            'email'=>'required|email',
            'telefone'=>'required|min:10|regex:/(?:[()\h-]*\d[()\h-]*)/',
        ],[
            'nome.required'=>"O :attribute é obrigatorio!",
            'email.required'=>"O :attribute é obrigatorio!",
            'email.email'=>"O email é obritatório!",
            'telefone.required'=>"O :attribute é obrigatorio!",
            'telefone.min'=>"telefone deve conter no minimo 10 caraceres!",
            'telefone.regex'=>"Insira um telefone válido! Formato: (11)11111-111",
            ]);

        $dados = [
            'nome'=> $request->nome,
            'email'=> $request->email,
            'telefone'=> $request->telefone,
        ];

        Cliente::create($dados);
        return redirect()->route('cliente.list')->with('success', "Cadastrado com sucesso!");
    }

    public function show(Request $request, cliente $cliente): View
    {
        return redirect()->route('cliente.index');
    }

    public function edit(Request $request, cliente $cliente): View
    {
        $documentos = Documento::orderBy('titular')->get();
        return view('cliente.form', compact('cliente'))->with('documentos', $documentos);
    }

    public function update(Request $request, cliente $cliente)
    {
        $request->validate([
            'nome'=>'required',
            'email'=>'required|email',
            'telefone'=>'required|min:10|regex:/(?:[()\h-]*\d[()\h-]*)/',
        ],[
            'nome.required'=>"O :attribute é obrigatorio!",
            'email.required'=>"O :attribute é obrigatorio!",
            'email.email'=>"O email é obritatório!",
            'telefone.required'=>"O :attribute é obrigatorio!",
            'telefone.min'=>"telefone deve conter no minimo 10 caraceres!",
            'telefone.regex'=>"Insira um telefone válido! Formato: (11)11111-111",
            ]);

        $dados = [
            'nome'=> $request->nome,
            'email'=> $request->email,
            'telefone'=> $request->telefone,
        ];

        Cliente::updateOrCreate(
            ['id' => $request->id],
            $dados
        );
        return redirect()->route('cliente.list')->with('success', "Alterado com sucesso!");
    }

    public function destroy($id)
    {

        $cliente = Cliente::findOrFail($id);

        $documento = Documento::where('cliente_id','=',$cliente->id);
        $documento->delete();


        $reserva = Reserva::where('cliente_id','=',$cliente->id);
        $reserva->delete();

        $cliente->delete();

        return redirect()->route('cliente.list')->with('success', "Removido com sucesso!");
    }

    public function search(Request $request)
    {
        if(!empty($request->valor)){
            $clientes = Cliente::where(
                $request->tipo,
                 'like' ,
                "%". $request->valor."%"
                )->get();
            } else {
                $clientes = Cliente::all();
            }
    
            return view('cliente.list')->with(['clientes'=> $clientes]);
    }

    public function detalhes($id) {
        $cliente = Cliente::findOrFail($id);
        $reservas = $cliente->reservas();
        $espacos = Espaco::all();

        if($cliente->documento) {
            $documentoId = $cliente->documento->id;
        }
        else {
            $documentoId = "";
        }
        
        $documento = Documento::find($documentoId);
        if($documento == null) {
            $documento = "";
        }

        return view('cliente.detalhes')->with(['cliente'=> $cliente, 'documento' => $documento, 'reservas' => $reservas, 'espacos' => $espacos]);
    }
}
