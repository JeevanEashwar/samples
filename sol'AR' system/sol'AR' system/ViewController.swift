//
//  ViewController.swift
//  sol'AR' system
//
//  Created by Brillio Mac Mini 5 on 16/01/18.
//  Copyright © 2018 brillio. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    var currentNodeIndex = 0
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet var addPlanetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        addPlanetButton.setTitle("Add Sun", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    //MARK: - Helpers
    struct myCameraCoordinates {
        var x = Float()
        var y = Float()
        var z = Float()
    }
    func getmyCameraCoordinates(sceneView:ARSCNView) -> myCameraCoordinates {
        let cameraTransform = sceneView.session.currentFrame?.camera.transform
        let cameraCoordinates:MDLTransform = MDLTransform(matrix: cameraTransform!)
        var cc = myCameraCoordinates()
        cc.x = cameraCoordinates.translation.x
        cc.y = cameraCoordinates.translation.y
        cc.z = cameraCoordinates.translation.z
        return cc
    }
    @IBAction func addPlanet(_ sender: Any) {
        let planetNode = SCNNode()
        let cameraCoordinates = getmyCameraCoordinates(sceneView: sceneView)
        planetNode.position = SCNVector3(x: cameraCoordinates.x, y: cameraCoordinates.y, z: cameraCoordinates.z-0.3)
        var nextPlanetName = ""
        switch currentNodeIndex {
        case 0:
            guard let virtualObjScene = SCNScene.init(named: "Sun.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Mercury"
        case 1:
            guard let virtualObjScene = SCNScene.init(named: "Mercury.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Venus"
        case 2:
            guard let virtualObjScene = SCNScene.init(named: "Venus.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Earth"
        case 3:
            guard let virtualObjScene = SCNScene.init(named: "Earth.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Mars"
        case 4:
            guard let virtualObjScene = SCNScene.init(named: "Mars.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Jupiter"
        case 5:
            guard let virtualObjScene = SCNScene.init(named: "Jupiter.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Saturn"
        case 6:
            guard let virtualObjScene = SCNScene.init(named: "Saturn.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Uranus"
        case 7:
            guard let virtualObjScene = SCNScene.init(named: "Uranus.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Neptune"
        case 8:
            guard let virtualObjScene = SCNScene.init(named: "Neptune.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = "Pluto"
        case 9:
            guard let virtualObjScene = SCNScene.init(named: "Pluto.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
            nextPlanetName = ""
        default:
            guard let virtualObjScene = SCNScene.init(named: "Earth.scn", inDirectory: "art.scnassets") else { return  }
            planetNode.addChildNode(virtualObjScene.rootNode)
        }
        sceneView.scene.rootNode.addChildNode(planetNode)
        currentNodeIndex+=1
        if(nextPlanetName == ""){
            addPlanetButton.isHidden = true
        }
        else{
            addPlanetButton.setTitle("Add \(nextPlanetName)", for: .normal)
        }
    }
    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }

    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
