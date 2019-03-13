import "bootstrap";
import "transition";
import { previewImageOnFileSelect } from 'photo-upload-preview/photo_upload_preview';
import { showTransactionDetails, turnArrow, hoverDetails } from 'pages/transaction';
import { cardUnlocked } from 'packs/store';
import { showPayoutCode } from 'packs/recent_payouts'
import { copyLink } from 'packs/recent_payouts'


previewImageOnFileSelect();
cardUnlocked();
turnArrow();
showTransactionDetails();
hoverDetails();
showPayoutCode();
copyLink();
