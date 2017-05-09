//
//  ViewController.swift
//  Facebook Animation
//
//  Created by Wilmer Mendoza on 7/5/17.
//  Copyright © 2017 Wilmer Mendoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let curvedView = CurvedView(frame: view.frame)
//        curvedView.backgroundColor = UIColor.yellow
//        
//        view.addSubview(curvedView)

        
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
        
        
    }
    
    func handleTap(){
    
        (0...10) .forEach { (_) in
            
            generateAnimetedViews()
            
        }
    
    }
    
    //MARK: METODO PARA GENERAR UNA IMAGEN CON SU RESPECTIVA ANIMACION Y SUS DIMENSIONES ALEATORIAS
    fileprivate func generateAnimetedViews(){
    
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "pulgar"): #imageLiteral(resourceName: "love")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48() * 10 //creando una dimension aleatoria entre 20 y 30 pt
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        
        //creando la animacion que usara la imagen
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48() * 3 //haciendo q la animacion para cada imageview dure entre 2 a 5 seg
        animation.fillMode = kCAFillModeForwards //se remueve la imagen cuando la animacion termina
        animation.isRemovedOnCompletion = false //
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) //la animacion comienza rapida y lo largo del tiempo se realentiza
        
        
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    
    
    }
    

}



//MARK:Metodo para crear un path personalizado
func customPath() -> UIBezierPath{
    
        //do some fancy curve drawing
        
        let path = UIBezierPath() //UIBezierPath permite crear un segmento de puntos para crear una linea
        
        path.move(to: CGPoint(x: 0, y: 200)) //moviendo la linea a las coordenadas especificadas
        
        let endPoint = CGPoint(x: 400, y: 200) //ubicacion del ultimo punto q conformara la linea
        
        //puntos de inflexion donde voy a curvar la linea
        let randomYShift = 200 + drand48() * 300 //genero un valor aleatorio entre 200 y 500 para el eje de las y
        print(100 - randomYShift)
    
        let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
        let cp2 = CGPoint(x: 200, y: 300 + randomYShift)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        
        return path

}


class CurvedView : UIView {
    
    override func draw(_ rect: CGRect) {

        let path = customPath()
        path.lineWidth = 3
        path.stroke()
        
        
    }

}
