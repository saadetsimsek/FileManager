//
//  ViewController.swift
//  FileManager
//
//  Created by Saadet Şimşek on 28/10/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        
        guard let url = manager.urls(for: .documentDirectory,
                                     in: .userDomainMask).first else {
            return
        }
        print(url.path())
        let newFolderURL = url.appendingPathComponent("sadee")
        let secondSubFolderURL = url.appendingPathComponent("secondFolder").appendingPathComponent("sadee").appendingPathComponent("sadee").appendingPathComponent("sadee")
        do{
         /*   try manager.createDirectory(at: secondSubFolderURL,
                                    withIntermediateDirectories: true,
                                    attributes: [:])
          */
            let fileURL = newFolderURL.appendingPathComponent("logs.txt")
            //MARK: TXT oluşturma
         /*   let data = "Writing text to a text file! Wooo".data(using: .utf8)
            manager.createFile(atPath: fileURL.path,
                               contents: data,
                               attributes: [FileAttributeKey.creationDate: Date()])
          */
            //MARK: TXT Silme
            if manager.fileExists(atPath: fileURL.path) {
                do{
                    try manager.removeItem(at: fileURL)
                }
                catch{
                    print(error)
                }
            }
            
            //MARK: - Dosya silme
          /*  let fileURL = url.appendingPathComponent("secondFolder")
            if manager.fileExists(atPath: fileURL.path) {
                do{
                    try manager.removeItem(at: fileURL)
                }
                catch{
                    print(error)
                }
            }
           */
            
        }
        catch {
            print(error)
        }
        
    }


}

