<?php

namespace App\Charts;

use ArielMejiaDev\LarapexCharts\LarapexChart;

use App\Models\Espaco;

class precoEspaco
{
    protected $chart;

    public function __construct(LarapexChart $chart)
    {
        $this->chart = $chart;
    }

    public function build(): \ArielMejiaDev\LarapexCharts\BarChart
    {
        $espacos = Espaco::all();

        $precoEspacos = [];
        $nomeEspacos = [];
        foreach ($espacos as $espaco) {
            array_push($precoEspacos, $espaco->valorHora);
            array_push($nomeEspacos, $espaco->nome);
        }

        return $this->chart->barChart()
            ->setTitle('Preco/hora espacos')
            ->addData('preco espacos',$precoEspacos)
            ->setLabels($nomeEspacos);
    }
}
