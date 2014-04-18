package com.T.chartsData;

import java.util.ArrayList;

public class HighchartsOption {

	public Title title;
	class Title{
		String text="";
		Title(String t){
			text=t;
		}
	}
	
	public Chart chart;
	class Chart{
		String type="";
		String renderTo="chartarea";
		
		Chart(String t){
			type=t;
		}
	}
	public ArrayList<double[][]> series;
	
	HighchartsOption(String text,String type){
		title=new Title(text);
		chart=new Chart(type);
		series.add(new double[][]{{1,2},{3,1}});
	}

}
