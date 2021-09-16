 
 
 import Foundation
 import UIKit
 
 
 class BotoesItens: NSObject {
    var imageName = ""
    var nomeBotao = ""
 }
 
 // MARK:- Equivalente a um cardView do Android, contém todos so elementos de cada index da UICollectionView
 class BotoesMenuCell: UICollectionViewCell {
      
    @IBOutlet weak var labelNomeBotao: UILabel!
    //    @IBOutlet weak var labelNomeBotao: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK:- Carrega os elementos com os respectivos valores
    func setUp(_ botaoItem: BotoesItens) {
        labelNomeBotao.text = String(botaoItem.nomeBotao)
    }
 }
