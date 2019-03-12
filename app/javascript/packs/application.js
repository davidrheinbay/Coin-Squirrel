import "bootstrap";
import "transition";
import { previewImageOnFileSelect } from 'photo-upload-preview/photo_upload_preview';
import { showTransactionDetails, turnArrow } from 'pages/transaction';
import { cardUnlocked } from 'packs/store';


previewImageOnFileSelect();
cardUnlocked();
turnArrow();
showTransactionDetails();
