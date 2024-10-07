import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import ID from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';

export default class Selector extends LightningElement {
    selectedProductId;

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }

    @wire(getRecord, { recordId: ID, fields: [NAME_FIELD] })
    user;

    get name() {
        console.log(this.user);
        return this.user.data.fields.Name.value;
    }
}
