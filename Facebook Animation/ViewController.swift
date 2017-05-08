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
        
        let curvedView = CurvedView(frame: view.frame)
        curvedView.backgroundColor = UIColor.yellow
        
        view.addSubview(curvedView)

        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "pulgar"))
        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        //creando la animacion que usara la imagen
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = customPath().cgPath
        animation.duration = 2
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
        let cp1 = CGPoint(x: 100, y: 100)
        let cp2 = CGPoint(x: 200, y: 300)
        
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
