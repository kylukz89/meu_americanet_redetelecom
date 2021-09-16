 
 import UIKit
 
 /**
  * Classe VIEW da tela principal do app
  *
  * @author        Igor Maximo
  * @date           24/08/2021
  */
 class PrincipalViewController: UIViewController {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    var itemSize = CGSize(width: 0, height: 0)
    var contratoItens = [ContratoItens]()
    var botoesMenuItens = [BotoesItens]()
    /////////
    @IBOutlet weak var collectionViewContratos: UICollectionView!
    @IBOutlet weak var collectionViewBotoesMenu: UICollectionView!
    @IBOutlet weak var labelNomeUsuario: UILabel!
    ////////
    private let contratoAPI: ContratoAPI = ContratoAPI()
    @IBOutlet var pageControl: UIPageControl!
    
    
    // MARK:- Constructor
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageControl.numberOfPages = 1
        
        self.setCarregarRoletaBotoesMenu()
        
        // Carrega os componentes da tela
        DispatchQueue.main.async {
            // Exibe o nome do usuário
            let nomeUsuario = UserDefaults.standard.string(forKey: "RZAO_SOCL_CLIE")!.lowercased().firstLetterUppercased()
            self.labelNomeUsuario.text! = (nomeUsuario.components(separatedBy: " ").first ?? "Developer")
            // Carrega a roleta com todos os contratos
            self.contratoAPI.getTodosContratosCliente(cpfCnpj: String(UserDefaults.standard.string(forKey: "CNPJ_CPF_CLIE") ?? "")) { (success, data) in
                // Popula a UICollectionView
                DispatchQueue.main.async {
                    self.setCarregarRoletaPlanos(listaContratos: data)
                    //                    self.setCarregarRoletaBotoesMenu()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private var cellId: Int!
    //MARK:- Carrega UICollectionView com a lista dos contratos
    private func setCarregarRoletaPlanos(listaContratos: [ContratoRoleta]) -> Void {
        self.cellId = 1
        // Popula a collectionview com dados da API
        for contrato in listaContratos {
            let appStoreItem = ContratoItens()
            appStoreItem.statusContrato = contrato.status
            appStoreItem.nomeContrato = contrato.nomePlano
            appStoreItem.enderecoContrato = contrato.enderecoInstalacaoTipo + " " + contrato.enderecoInstalacaoRua + " " + contrato.enderecoInstalacaoNumero
            appStoreItem.valorContrato = contrato.valorFinal
            appStoreItem.vencimentoContrato = contrato.vencimentoDia
            // Add na lista de células da collectionView
            contratoItens.append(appStoreItem)
        }
        collectionViewContratos.dataSource = self
        collectionViewContratos.delegate = self
        if let layout = collectionViewContratos.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionViewContratos.isPagingEnabled = false
        view.layoutIfNeeded()
        let width = collectionViewContratos.bounds.size.width
        let height = collectionViewContratos.bounds.size.height // width * (9/16)
        itemSize = CGSize(width: width, height: height)
        view.layoutIfNeeded()
        collectionViewContratos.reloadData()
    }
    
    
    //MARK:- Carrega UICollectionView com a lista dos contratos
    private func setCarregarRoletaBotoesMenu() -> Void {
        self.cellId = 2
        // Popula a collectionview com dados da API
        for i in 0..<10 {
            let botaoItem = BotoesItens()
            botaoItem.nomeBotao = "Botão"
            // Add na lista de células da collectionView
            botoesMenuItens.append(botaoItem)
        }
        collectionViewBotoesMenu.dataSource = self
        collectionViewBotoesMenu.delegate = self
        if let layout = collectionViewBotoesMenu.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionViewBotoesMenu.isPagingEnabled = false
        view.layoutIfNeeded()
        let width = collectionViewBotoesMenu.bounds.size.width
        let height = collectionViewBotoesMenu.bounds.size.height // width * (9/16)
        itemSize = CGSize(width: 125, height: height)
        view.layoutIfNeeded()
        collectionViewBotoesMenu.reloadData()
    }
 }
  
 
 extension PrincipalViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Valida qual collectionView usar
        if self.cellId == 1 {
            let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
            let index = scrollView.contentOffset.x / witdh
            let roundedIndex = round(index)
            self.pageControl.currentPage = Int(roundedIndex)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Valida qual collectionView usar
        if self.cellId == 1 {
            pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // Valida qual collectionView usar
        if self.cellId == 1 {
            pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Valida qual collectionView usar
        if collectionView == collectionViewContratos {
            let count = contratoItens.count
            pageControl.numberOfPages = count
            pageControl.isHidden = !(count > 1)
            return count
        } else {
            let count = botoesMenuItens.count 
            return count
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Valida qual collectionView usar
        if collectionView == collectionViewContratos {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppStoreCell", for: indexPath) as! ContratoCell
            cell.setUp(contratoItens[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BotoesMenuCell", for: indexPath) as! BotoesMenuCell
            cell.setUp(botoesMenuItens[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { 
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
    
    //MARK: flowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if self.cellId == 1 {
            let pageWidth = itemSize.width
            targetContentOffset.pointee = scrollView.contentOffset
            var factor: CGFloat = 0.5
            if velocity.x < 0 {
                factor = -factor
            }
            var index = Int( round((scrollView.contentOffset.x/pageWidth)+factor) )
            if index < 0 {
                index = 0
            }
            if index > contratoItens.count-1 {
                index = contratoItens.count-1
            }
            let indexPath = IndexPath(row: index, section: 0)
            collectionViewContratos?.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
 }
 
 
 extension String {
    func firstLetterUppercased() -> String {
        guard let first = first, first.isLowercase else { return self }
        return String(first).uppercased() + dropFirst()
    }
 }
 
 
 extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
 }
 
