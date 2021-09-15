
import UIKit
 
/**
 * Classe VIEW de autenticação
 *
 * @author        Igor Maximo
 * @date           15/02/2021
 */
class LoginViewController: UIViewController {
    // MARK: - Stored Properties
    var loginViewModel: LoginViewModel = LoginViewModel() 
    //MARK: - IBOutlets
    @IBOutlet weak var campoCPFCNPJ: BindingTextField! {
        didSet {
            self.campoCPFCNPJ.bind {
                self.loginViewModel.campoCPFCNPJ.value = $0
            }
        }
    }
    @IBOutlet weak var campoSenha: BindingTextField! {
        didSet {
            self.campoSenha.bind {
                self.loginViewModel.campoSenha.value = $0
            }
        }
    } 
     
    @IBOutlet weak var botaoAcessar: UIButton!
    // MARK: - ViewController States
    override func viewDidLoad() { 
        super.viewDidLoad()
        self.campoSenha.isSecureTextEntry = true
        setDelegates()
        setupButton()
    }
      
    // MARK:- Botão acessar que consulta via API a autenticação do usuário
    @IBAction func botaoAcessarPressed(_ sender: UIButton) {
        // Vibra ao tocar botão
        Ferramentas.setVibrar()
        // Ilustra spinner na main thread
        Alert.setSpinner(self, seExibe: true)
        // Thread paralela com alias "validacao"
        DispatchQueue(label: "validacao").async {
            sleep(1)
            // Aqui, verificamos a entrada de credenciais do usuário - se estiver correto, chamamos login ()
            switch self.loginViewModel.setValidacaoLogin(self) {
            case .Correto:
                // Atualiza a main thread
                DispatchQueue.main.async { [self] in
                    Alert.setSpinner(self, seExibe: false)
                    self.loginViewModel.setLogar(self) 
                }
            case .Incorreto:
                // Atualiza a main thread
                DispatchQueue.main.async { [self] in
                    Alert.setSpinner(self, seExibe: false)
                    bindData()
                    Ferramentas.setVibrar()
                }
                return
            }
        }
    }
     
    // MARK:- Botão acessar que consulta via API a autenticação do usuário
    func bindData() {
        loginViewModel.erroCredenciaisLogin.bind { [weak self] in
            Alert().setShowAlertView(self!, message: $0, titulo: "Alerta", false)
        }
        loginViewModel.errorMessage.bind {
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


 
