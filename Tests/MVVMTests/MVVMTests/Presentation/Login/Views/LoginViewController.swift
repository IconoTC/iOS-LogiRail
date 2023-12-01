//
//  LoginViewController.swift
//  MVVMTests
//
//  Created by David Jardon on 29/11/23.
//

import UIKit

@MainActor
class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingView: UIView!

    @IBAction func onLoginPressed(_ sender: UIButton) {
        viewModel?.onLoginPressed(
            email: emailField.text,
            password: passwordField.text
        )
    }

    var viewModel: LoginViewModel?

    private enum FieldType: Int {
        case email = 0
        case password
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setObservers()
    }

    private func initViews() {
        emailField.delegate = self
        passwordField.delegate = self

        emailField.tag = FieldType.email.rawValue
        passwordField.tag = FieldType.password.rawValue

        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(dismissKeyboard)
            )
        )
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.loadingView.isHidden = !isLoading

                    case .showErrorEmail(let error):
                        self?.emailError.text = error
                        self?.emailError.isHidden = (error == nil || error?.isEmpty == true)

                    case .showErrorPassword(let error):
                        self?.passwordError.text = error
                        self?.passwordError.isHidden = (error == nil || error?.isEmpty == true)
                }
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch FieldType(rawValue: textField.tag) {
            case .email:
                emailError.text = nil
                emailError.isHidden = true

            case .password:
                passwordError.text = nil
                passwordError.isHidden = true

            default:
                break
        }
    }
}
