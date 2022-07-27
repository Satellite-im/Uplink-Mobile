import AppScreen from '../screenobjects/AppScreen'

class PinScreen extends AppScreen {
    constructor () {
        super('~Create Account Pin');
    }

    private get headerText() {
        return $('~Create Account Pin').getText()
    }

    private get subtitleText() {
        return $(`~Create a pin to protect your account. 
        The pin can be anything you want, just don’t forget it.`).getText()
    }

    private get options() {
        return $('~Pin Options')
    }

    async validateTexts() {
        await expect(this.headerText).toContain('Create Account Pin')
        await expect(this.subtitleText).toContain('Create a pin to protect your account.')
        await expect(this.subtitleText).toContain('The pin can be anything you want, just don’t forget it.')
        await expect(this.options.getText).toContain('Pin Options}')
    }

    async clickOnNext() {
        let button:WebdriverIO.Element
        let selector: string
        if (driver.isIOS) {
            selector = '**/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[3]'
            button = await $(`-ios class chain:${selector}`)
            await button.click()
        } else if (driver.isAndroid) {
            selector = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[14]'
            button = await $(`${selector}`)
            await button.click()
        }
    }

    async clickOnDelete() {
        let button:WebdriverIO.Element
        let selector: string
        if (driver.isIOS) {
            selector = '**/XCUIElementTypeWindow/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]/XCUIElementTypeOther[2]'
            button = await $(`-ios class chain:${selector}`)
            await button.click()
        } else if (driver.isAndroid) {
            selector = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[12]'
            button = await $(`${selector}`)
            await button.click()
        }
    }

    async removePin(times: number) {
        for (let i = 0; i < times; i++) {
                this.clickOnDelete()
        }
    }

    async typePin(pin: string) {
        for (let i = 0; i < pin.length; i++) {
            await $('~' + pin[i]).click()
        }
    }

    async assertPin(expectedPin: string) {
        let button: WebdriverIO.Element
        let pinDisplayed = ''
        let androidIndex = 2
        for (let i = 0; i < expectedPin.length; i++) {
            if (driver.isIOS) {
                button = await $(`-ios class chain:**/XCUIElementTypeStaticText[\`label == "${expectedPin[i]}"\`][1]`)
                pinDisplayed += await button.getText()
            } else if (driver.isAndroid) {
                androidIndex += i
                const selector = `android=new UiSelector().clickable(false).index(${androidIndex})`
                button = await $(selector)
                pinDisplayed += await button.getText()
            }
        }
        await expect(pinDisplayed).toEqual(expectedPin)
    }

    async changePinSize(size: string) {
        await (await this.options).click()
        await (await $('~' + size + ' Digits')).click()
    }

}

export default new PinScreen();
