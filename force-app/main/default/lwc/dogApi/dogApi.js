/*
*
*  Purpose          :	JS  to show restCallout from LWC Component using Apex and Fetch.
*
*  Created Date     :  	15/12/2022
*
*  Created By       :  	Shailendra Sharma
*
*  Revision Logs    :  	V_1.0 - Created - 15/12/2022
*
*/
import { LightningElement, api } from 'lwc';

import getDogPictureDetails from '@salesforce/apex/DogPictureCalloutLwcController.getDogPicture';

//Importing Custom Events
import { handleGridLayouting } from './dogApiUtils.js';

const CARD_TITLE_TEXT = 'Dog API - Get random dog picture';

export default class DogApi extends LightningElement 
{
    @api flexipageRegionWidth;

    layoutSizeLarge;
    layoutSizeMedium;
    layoutSizeSmall;

    layoutSizeSmallButtons;
    layoutSizeMediumButtons;
    layoutSizeLargeButtons;

    cardTitle;

    imageReady = false;
    imageReady2 = false;

    loadingSpinner = false;

    pictureUrl;
    secondPictureUrl;

    connectedCallback() 
    {
        this.cardTitle = CARD_TITLE_TEXT + ' - ' + this.flexipageRegionWidth;
        this.handleGridLayouting();
    }

    //Grid Layout handling
    handleGridLayouting() 
    {
        handleGridLayouting(this.flexipageRegionWidth, this);
    }
    
    handleClick()
    {
        this.loadingSpinner = true;
        this.imageReady = false;
        
        getDogPictureDetails({}).then(resp => 
        {
            this.pictureUrl = JSON.parse(resp).message;
            this.imageReady = true;
            this.loadingSpinner = false;
        })
    }

    handleClick2()
    {
        this.loadingSpinner = true;
        this.imageReady2 = false;
        fetch('https://dog.ceo/api/breeds/image/random', {method: "GET"})
        .then(response => response.json())
        .then(data => 
        {
            this.secondPictureUrl = data.message;
            this.imageReady2 = true;
            this.loadingSpinner = false;
        });
    }

    handleClick3() 
    {
        this.loadingSpinner = true;
        this.imageReady = false;
        
        getDogPictureDetails({})
        .then(resp => 
        {
            this.pictureUrl = JSON.parse(resp).message;
            this.imageReady = true;
        })
        .then(() =>
        {
            fetch('https://dog.ceo/api/breeds/image/random', {method: "GET"})
            .then(response => response.json())
            .then(data => 
            {
                this.secondPictureUrl = data.message;
                this.imageReady2 = true;
                this.loadingSpinner = false;
            });
        })
        .catch((error) => {
        window.alert(error);
        });
    }
}