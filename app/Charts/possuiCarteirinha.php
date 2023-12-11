<?php

namespace App\Charts;

use App\Models\Documento;
use ArielMejiaDev\LarapexCharts\LarapexChart;

class possuiCarteirinha
{
    protected $chart;

    public function __construct(LarapexChart $chart)
    {
        $this->chart = $chart;
    }

    public function build(): \ArielMejiaDev\LarapexCharts\PieChart
    {

        $planos = Documento::select('plano')->distinct()->get()->toArray();
        //dd($planos);
        $count = 0;
        $countPlanos = [];
        $planos_string = [];

        foreach ($planos as $plano){
            
            foreach($plano as $item){
                
            $countPlano = Documento::where('plano','=',$plano)->count();

                array_push($countPlanos,$countPlano);
            
                array_push($planos_string,$item);
            }
        }
      //dd($countPlanos);

        return $this->chart->pieChart()
            ->setTitle('Planos de Clientes')
            ->addData($countPlanos,'qtdCamas')
            ->setLabels($planos_string);
    }
}
