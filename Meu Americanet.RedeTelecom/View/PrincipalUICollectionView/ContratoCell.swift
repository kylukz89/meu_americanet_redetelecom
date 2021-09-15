 
 
 import Foundation
 import UIKit
 
 
 class ContratoItens: NSObject {
    var imageName = ""
    var statusContrato = ""
    var nomeContrato = ""
    var enderecoContrato = ""
    var valorContrato: Float = 0
    var vencimentoContrato: Int = 0
 }
 
 // MARK:- Equivalente a um cardView do Android, contém todos so elementos de cada index da UICollectionView
 class ContratoCell: UICollectionViewCell {
    @IBOutlet weak var imageViewStatusContrato: UIImageView!
    @IBOutlet weak var labelStatusContrato: UILabel!
    @IBOutlet weak var labelNomeContrato: UILabel!
    @IBOutlet weak var labelEnderecoContrato: UILabel!
    @IBOutlet weak var labelValorContrato: UILabel!
    @IBOutlet weak var labelVencimentoContrato: UILabel!
    //
    @IBOutlet weak var celulaCollectionView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK:- Carrega os elementos com os respectivos valores
    func setUp(_ contratoItem: ContratoItens) {
        labelStatusContrato.text = String(contratoItem.statusContrato)
        labelNomeContrato.text = String(contratoItem.nomeContrato)
        labelEnderecoContrato.text = String(contratoItem.enderecoContrato)
        labelValorContrato.text = "R$ \(Ferramentas.setMascaraDinheiroReal(valor: contratoItem.valorContrato))"
        labelVencimentoContrato.text = "Vence todo dia \(String(contratoItem.vencimentoContrato)) de cada mês."
        // Define a cor do ícone do contrato com base no status
        self.setCorPorStatusContrato(status: String(contratoItem.statusContrato))
        // Define a cor de gradient do background da cell da uicollection
        self.setGradientBackground(self.celulaCollectionView, colorTop: UIColor.systemGray3, colorBottom: UIColor.white)
    }
    
    // MARK:- Define a cor do ícone do contrato com base no status
    private func setCorPorStatusContrato(status: String) {
        switch status {
        case "ATIVO":
            labelStatusContrato.textColor = UIColor.systemGreen
            imageViewStatusContrato.tintColor = UIColor.green
        case "BLOQUEADO":
            labelStatusContrato.textColor = UIColor.red
            imageViewStatusContrato.tintColor = UIColor.red
        default:
            labelStatusContrato.textColor = UIColor.blue
            imageViewStatusContrato.tintColor = UIColor.blue
        }
    }
    
    func setGradientBackground(_ controller: UIView, colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 8.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = controller.bounds
        controller.layer.insertSublayer(gradientLayer, at: 0)
    }
 }
 
