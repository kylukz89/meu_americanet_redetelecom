 
 import Foundation
 import UIKit
  
   
 
 
// extension PrincipalViewControllerrrrr: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    //MARK:- Carrega UICollectionView com a lista dos contratos
//    private func setCarregarRoletaPlanos(listaContratos: [ContratoRoleta]) -> Void {
//        // Popula a collectionview com dados da API
//        for contrato in listaContratos {
//            let appStoreItem = ContratoItens()
//            appStoreItem.statusContrato = contrato.status
//            appStoreItem.nomeContrato = contrato.nomePlano
//            appStoreItem.enderecoContrato = contrato.enderecoInstalacaoTipo + " " + contrato.enderecoInstalacaoRua + " " + contrato.enderecoInstalacaoNumero
//            appStoreItem.valorContrato = contrato.valorFinal
//            appStoreItem.vencimentoContrato = contrato.vencimentoDia
//            // Add na lista de células da collectionView
//            contratoItens.append(appStoreItem)
//        }
//        collectionViewContratos.dataSource = self
//        collectionViewContratos.delegate = self
//        if let layout = collectionViewContratos.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
//        collectionViewContratos.isPagingEnabled = false
//        view.layoutIfNeeded()
//        let width = collectionViewContratos.bounds.size.width
//        let height = collectionViewContratos.bounds.size.height // width * (9/16)
//        itemSize = CGSize(width: width, height: height)
//        print("itemSize: \(itemSize)")
//        view.layoutIfNeeded()
//        collectionViewContratos.reloadData()
//    }
//
//    /*
//    //MARK:- Carrega UICollectionView com a lista dos contratos
//    private func setCarregarRoletaBotoesMenu() -> Void {
//        // Popula a collectionview com dados da API
//        for i in 0..<10 {
//            //
//        }
//        collectionViewBotoesMenu.dataSource = self
//        collectionViewBotoesMenu.delegate = self
//        if let layout = collectionViewBotoesMenu.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//        }
//        collectionViewBotoesMenu.isPagingEnabled = false
//        view.layoutIfNeeded()
//        let width = collectionViewBotoesMenu.bounds.size.width
//        let height = collectionViewBotoesMenu.bounds.size.height // width * (9/16)
//        itemSize = CGSize(width: width, height: height)
//        print("itemSize: \(itemSize)")
//        view.layoutIfNeeded()
//        collectionViewBotoesMenu.reloadData()
//    }
//    */
//
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
//        let index = scrollView.contentOffset.x / witdh
//        let roundedIndex = round(index)
//        self.pageControl.currentPage = Int(roundedIndex)
//    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
//    }
//
//    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let count = contratoItens.count
//        pageControl.numberOfPages = count
//        pageControl.isHidden = !(count > 1)
//        return count
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    @available(iOS 6.0, *)
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppStoreCell", for: indexPath) as! ContratoCell
//        cell.setUp(contratoItens[indexPath.row])
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
//    }
//
//    //MARK: flowlayout
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return sectionInsets
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return sectionInsets.left
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return itemSize
//    }
//
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let pageWidth = itemSize.width
//        targetContentOffset.pointee = scrollView.contentOffset
//        var factor: CGFloat = 0.5
//        if velocity.x < 0 {
//            factor = -factor
//        }
//        var index = Int( round((scrollView.contentOffset.x/pageWidth)+factor) )
//        if index < 0 {
//            index = 0
//        }
//        if index > contratoItens.count-1 {
//            index = contratoItens.count-1
//        }
//        let indexPath = IndexPath(row: index, section: 0)
//        collectionViewContratos?.scrollToItem(at: indexPath, at: .left, animated: true)
//    }
//
//
// }
//
// class ContratoItens: NSObject {
//    var imageName = ""
//    var statusContrato = ""
//    var nomeContrato = ""
//    var enderecoContrato = ""
//    var valorContrato: Float = 0
//    var vencimentoContrato: Int = 0
// }
//
// // MARK:- Equivalente a um cardView do Android, contém todos so elementos de cada index da UICollectionView
// class ContratoCell: UICollectionViewCell {
//    @IBOutlet weak var imageViewStatusContrato: UIImageView!
//    @IBOutlet weak var labelStatusContrato: UILabel!
//    @IBOutlet weak var labelNomeContrato: UILabel!
//    @IBOutlet weak var labelEnderecoContrato: UILabel!
//    @IBOutlet weak var labelValorContrato: UILabel!
//    @IBOutlet weak var labelVencimentoContrato: UILabel!
//    //
//    @IBOutlet weak var celulaCollectionView: UIView!
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    // MARK:- Carrega os elementos com os respectivos valores
//    func setUp(_ contratoItem: ContratoItens) {
//        labelStatusContrato.text = String(contratoItem.statusContrato)
//        labelNomeContrato.text = String(contratoItem.nomeContrato)
//        labelEnderecoContrato.text = String(contratoItem.enderecoContrato)
//        labelValorContrato.text = "R$ \(Ferramentas.setMascaraDinheiroReal(valor: contratoItem.valorContrato))"
//        labelVencimentoContrato.text = "Vence todo dia \(String(contratoItem.vencimentoContrato)) de cada mês."
//        // Define a cor do ícone do contrato com base no status
//        self.setCorPorStatusContrato(status: String(contratoItem.statusContrato))
//        // Define a cor de gradient do background da cell da uicollection
//        self.setGradientBackground(self.celulaCollectionView, colorTop: UIColor.systemGray3, colorBottom: UIColor.white)
//    }
//
//    // MARK:- Define a cor do ícone do contrato com base no status
//    private func setCorPorStatusContrato(status: String) {
//        switch status {
//        case "ATIVO":
//            labelStatusContrato.textColor = UIColor.systemGreen
//            imageViewStatusContrato.tintColor = UIColor.green
//        case "BLOQUEADO":
//            labelStatusContrato.textColor = UIColor.red
//            imageViewStatusContrato.tintColor = UIColor.red
//        default:
//            labelStatusContrato.textColor = UIColor.blue
//            imageViewStatusContrato.tintColor = UIColor.blue
//        }
//    }
//
//    func setGradientBackground(_ controller: UIView, colorTop: UIColor, colorBottom: UIColor){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.5, y: 8.5)
//        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
//        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
//        gradientLayer.frame = controller.bounds
//        controller.layer.insertSublayer(gradientLayer, at: 0)
//    }
// }
