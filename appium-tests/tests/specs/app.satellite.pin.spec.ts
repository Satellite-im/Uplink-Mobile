import PinScreen from '../screenobjects/PinScreen';

describe('Pin Screen Uplink,', () => {
    beforeEach(async () => {
        await PinScreen.waitForIsShown(true);
    });

    it('Assert screen texts', () => {
        PinScreen.validateTexts()
    })

    it('Should be able to type a PIN successfully', async () => {
        // Always make sure you are on the right tab
        await PinScreen.typePin('1234')
    });

    it.skip('PIN displyed in screen should be the same as the one entered by the user', async () => {
        // Always make sure you are on the right tab
        await PinScreen.assertPin('1234')
    });

    it('User should be able to delete the PIN previously entered', async () => {
        await PinScreen.removePin(4)
    });

    it('User should be able to change the PIN options to 6 digits', async () => {
        await PinScreen.changePinSize('6')
        await PinScreen.typePin('123456')
    });

    it('User should be able to change the PIN options to 8 digits', async () => {
        await PinScreen.changePinSize('8')
        await PinScreen.typePin('12345678')
    });

    it('User should be able to return the PIN options to 4 digits', async () => {
        await PinScreen.changePinSize('4')
        await PinScreen.typePin('1234')
    });

    it('User should be able to go to Next Screen after typing a PIN', async () => {
        await PinScreen.clickOnNext()
    })
});
