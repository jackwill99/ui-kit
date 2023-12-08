//
//  CalculatorViewController.swift
//  ui_kit_autolayout
//
//  Created by Tensor Lab on 11/24/23.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var lblDisplayValue: UILabel!

    var displayValue = "0"
    var storeValue = "0"

    var currentOperator = ""

    override func viewDidLoad() {
        lblDisplayValue.text = displayValue
        super.viewDidLoad()
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 11:
            print("+")
            currentOperator = "+"

            if checkProcess() {
                return
            }

            sum()
        case 12:
            print("-")
            currentOperator = "-"

            if checkProcess() {
                return
            }

            substract()
        case 13:
            print("x")
            currentOperator = "x"

            if checkProcess() {
                return
            }

            multiply()
        case 14:
            print("/")
            currentOperator = "/"

            if checkProcess() {
                return
            }

            division()
        case 15:
            print("=")
            if currentOperator.isEmpty {
                print("is MT")
                lblDisplayValue.text = storeValue

            } else {
                switch currentOperator {
                case "+":
                    sum()
                case "-":
                    substract()
                case "x":
                    multiply()
                case "/":
                    division()
                default:
                    break
                }
            }

        case 16:
            print("AC")
            displayValue = "0"
            storeValue = "0"
            currentOperator = ""

            lblDisplayValue.text = "0"
        default:
            print("number clicked")

            if sender.tag == 0, displayValue == "0" {
                return
            }

            if sender.tag != 0, sender.tag != 10, displayValue == "0" {
                print("here")
                displayValue = ""
            }

            if sender.tag == 10 {
                if !displayValue.contains(".") {
                    displayValue += "."
                    lblDisplayValue.text = displayValue
                }

            } else {
                displayValue += String(sender.tag)
                lblDisplayValue.text = displayValue
            }
        }
    }

    // MARK: - Operator

    private func sum() {
        let isDouble = checkDouble(to: storeValue, with: displayValue)

        printValue()

        if isDouble {
            storeValue = String(Double(storeValue)! + Double(displayValue)!)
        } else {
            storeValue = String(Int(storeValue)! + Int(displayValue)!)
        }

        reset()

        print("sum result : \(storeValue)")
    }

    private func substract() {
        let isDouble = checkDouble(to: storeValue, with: displayValue)

        printValue()

        if isDouble {
            storeValue = String(Double(storeValue)! - Double(displayValue)!)
        } else {
            storeValue = String(Int(storeValue)! - Int(displayValue)!)
        }

        reset()

        print("substract result : \(storeValue)")
    }

    private func multiply() {
        let isDouble = checkDouble(to: storeValue, with: displayValue)

        printValue()

        if isDouble {
            storeValue = String(Double(storeValue)! * Double(displayValue)!)
        } else {
            storeValue = String(Int(storeValue)! * Int(displayValue)!)
        }

        reset()
        print("multiply result : \(storeValue)")
    }

    private func division() {
        let isDouble = checkDouble(to: storeValue, with: displayValue)

        printValue()

        if isDouble {
            storeValue = String(Double(storeValue)! / Double(displayValue)!)
        } else {
            storeValue = String(Int(storeValue)! / Int(displayValue)!)
        }

        reset()
        print("division result : \(storeValue)")
    }

    // MARK: - Operation

    private func checkDouble(to firstValue: String, with secondValue: String) -> Bool {
        if firstValue.contains(".") || secondValue.contains(".") {
            return true
        }
        return false
    }

    private func reset() {
        lblDisplayValue.text = storeValue
        displayValue = "0"
    }

    private func checkProcess() -> Bool {
        if displayValue == "0" {
            return true
        }

        if storeValue == "0" {
            storeValue = displayValue
            reset()
            return true
        }

        return false
    }

    private func printValue() {
        print("storeValue \(storeValue) , displayValue \(displayValue)")
    }
}
