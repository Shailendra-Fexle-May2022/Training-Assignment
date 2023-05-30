/*
Purpose         :   Utilities JS specific to DOG Api component
Created By      :   Shailendra Sharma
Created Date    :   20/12/2022
Current Version :   v1.0
Revision Log    :   V_1.0 Created - Abhinav Sharma - 20/12/2022
*/
//Exporting a function
const handleGridLayouting = function(flexiRegionWidthValue, thisReference)
{
    if(flexiRegionWidthValue) 
    {
        switch (flexiRegionWidthValue) 
        {
            case 'XLARGE':
            case 'LARGE':
                thisReference.layoutSizeLarge = 6;
                thisReference.layoutSizeMedium = 6;
                thisReference.layoutSizeSmall = 6;

                thisReference.layoutSizeSmallButtons = 4;
                thisReference.layoutSizeMediumButtons = 4;
                thisReference.layoutSizeLargeButtons = 4;

                break;
            case 'MEDIUM':
                thisReference.layoutSizeLarge = 6;
                thisReference.layoutSizeMedium = 12;
                thisReference.layoutSizeSmall = 12;

                thisReference.layoutSizeSmallButtons = 12;
                thisReference.layoutSizeMediumButtons = 4;
                thisReference.layoutSizeLargeButtons = 4;
                break;
            case 'SMALL':
                thisReference.layoutSizeLarge = 12;
                thisReference.layoutSizeMedium = 12;
                thisReference.layoutSizeSmall = 12;

                thisReference.layoutSizeSmallButtons = 12;
                thisReference.layoutSizeMediumButtons = 12;
                thisReference.layoutSizeLargeButtons = 12;
                break;
            default:
                thisReference.layoutSizeLarge = 6;
                thisReference.layoutSizeMedium = 6;
                thisReference.layoutSizeSmall = 12;

                thisReference.layoutSizeSmallButtons = 12;
                thisReference.layoutSizeMediumButtons = 12;
                thisReference.layoutSizeLargeButtons = 12;                  
        }
    }
    else 
    {
        thisReference.layoutSizeLarge = 6;
        thisReference.layoutSizeMedium = 6;
        thisReference.layoutSizeSmall = 12;

        thisReference.layoutSizeSmallButtons = 12;
        thisReference.layoutSizeMediumButtons = 12;
        thisReference.layoutSizeLargeButtons = 12;
    }
}

export {handleGridLayouting};