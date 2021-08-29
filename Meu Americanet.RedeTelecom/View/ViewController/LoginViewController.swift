
import UIKit
 
/**
 * Classe VIEW de autenticação
 *
 * @author        Igor Maximo
 * @date           15/02/2021
 */
class LoginViewController: UIViewController {
    // MARK: - Stored Properties
    var loginViewModel: LoginViewModel!
    //MARK: - IBOutlets
    @IBOutlet weak var campoCPFCNPJ: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    @IBOutlet weak var botaoAcessar: UIButton!
    // MARK: - ViewController States
    override func viewDidLoad() {
        super.viewDidLoad()
        // Esconde os campos de senha
        self.campoSenha.isSecureTextEntry = true
        //////////////////
        setDelegates()
        setupButton()
        bindData() 
    }
    
    let ferramenta = Ferramentas()
     
    // MARK:- Botão acessar que consulta via API a autenticação do usuário
    @IBAction func botaoAcessarPressed(_ sender: UIButton) {
        Ferramentas.setVibrar()
       // let controll = self.ferramenta.setSpinner(self, seExibe: true)
        
       
 
       
       
       
        
        
        loginViewModel = LoginViewModel(loginManager: UsuarioAPI())
        // Aqui, pedimos ao viewModel para atualizar o modelo com as credenciais existentes dos campos de texto
        loginViewModel.updateCredentials(cpfCnpj: campoCPFCNPJ.text!, senha: campoSenha.text!)
        
        
//        Ferramentas.setSpinner(self, seExibe: false)
        
        
        // Aqui, verificamos a entrada de credenciais do usuário - se estiver correto, chamamos login ()
        switch loginViewModel.credentialsInput() {
            case .Correct:
                loginViewModel.login()
                
            case .Incorrect:
                bindData()
                return
        }
        
        
    }
    
    
    
    
    // MARK:- Botão acessar que consulta via API a autenticação do usuário
    func bindData() {
        loginViewModel?.erroCredenciaisLogin.bind { [weak self] in
            AlertToast().setShowAlertView(self!, message: $0, titulo: "Alerta", false)
        }
        loginViewModel?.errorMessage.bind {
            guard $0 != nil else { return } 
        }
    }
     
    func setupButton() {
        botaoAcessar.layer.cornerRadius = 10
        self.campoCPFCNPJ.setUnderLine()
        self.campoSenha.setUnderLine()
    }
     
    func setDelegates() {
        self.campoCPFCNPJ.delegate = self
        self.campoSenha.delegate = self
    }
     
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
}

//MARK: - Text Field Delegate Methods
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        campoCPFCNPJ.resignFirstResponder()
        campoSenha.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // loginErrorDescriptionLabel.isHidden = true
        campoCPFCNPJ.layer.borderWidth = 0
        campoSenha.layer.borderWidth = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
     
//    private func textFieldDidBeginEditingg(textField: UITextField!) {
//        campoCPFCNPJ?.text = Mask().setMascara(number: campoCPFCNPJ.text!)
//    }
}

// Insere underline branco campos de autenticação
extension UITextField {
    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(1.5)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}


 
