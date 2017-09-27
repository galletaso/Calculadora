//
//  ViewController.swift
//  Calculadora
//
//  Created by CETYS on 26/09/17.
//  Copyright © 2017 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var miniPantalla: UILabel!
    @IBOutlet weak var pantalla: UILabel!
    
    var elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero : Bool = false
    
    var operando1 : Double = 0;
    var operando2 : Double = 0;
    var operacion : String = ""
    
    
    @IBAction func operacionPulsada(_ sender: UIButton) {
        let numero : NSString = pantalla.text! as NSString
        operando1 = numero.doubleValue
        
        //guardo la operacion pulsada
        operacion = sender.currentTitle!
        miniPantalla.text = pantalla.text
        //pongo la pantalla a "0" para indicar que se escriba el segundo operando
        pantalla.text = "0"
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
    }
    
    @IBAction func enterPulsado() {
        let numero : NSString = pantalla.text! as NSString
        
        operando2 = numero.doubleValue
        
        let resultado = realizaOperacion()
        pantalla.text = String(format: "%g", resultado	)
    }
    
    @IBAction func numeroPulsado(_ sender: UIButton) {
        
        let digito : String! = sender.currentTitle
        
        if elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero{
            
            pantalla.text = pantalla.text! + digito
        }
        else{
            pantalla.text = digito
            elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = true
        }
        
        print(digito)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func realizaOperacion() ->Double{
        var resultado : Double = 0
        
        //codigo para la suma
        if operacion == "+"{
            resultado = operando1 + operando2
        }
        return resultado
    }
    


}

