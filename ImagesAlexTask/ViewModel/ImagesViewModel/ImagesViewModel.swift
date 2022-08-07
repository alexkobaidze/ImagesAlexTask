//
//  ImagesViewModel.swift
//  ImagesAlexTask
//
//  Created by Alex on 05.08.22.
//

import Foundation
class ImagesViewModel: ViewModelProtocol {
    
    private var hitsContainer: [HitsContainer] = []{
        didSet{
            updateCallBack()
        }
    }
    
    var updateCallBack: ()-> Void
    
    init(updateCallBack: @escaping ()-> Void) {
        self.updateCallBack = updateCallBack
    }
    
    func loadData() {
        let urlString = BaseURl.baseURL + BaseURl.keyEqual + Secret.pixaBayKey
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            if let error = error {
                print(error, "data error")
            }
            guard let jsonObject = try? JSONDecoder().decode(StructFashion.self, from: data).hits else { return }
            self.hitsContainer = jsonObject
        }.resume()
    }
    
    func getObject()-> [HitsContainer] {
        return hitsContainer
    }
    
    func getViewModel(index: Int) -> ViewModelGetObject {
        return ViewModelGetObject(hitsContainer: hitsContainer[index])
    }
}

protocol ViewModelProtocol {
    func loadData()
    func getObject()-> [HitsContainer]
    func getViewModel(index: Int) -> ViewModelGetObject
}
