import "bootstrap";
import "transition";
import { previewImageOnFileSelect } from 'photo-upload-preview/photo_upload_preview';
import { copyTooltips, showTransactionDetails, turnArrow, hoverDetails } from 'pages/transaction';
import { cardUnlocked } from 'packs/store';
import { showPayoutCode } from 'packs/recent_payouts'
import { copyLink, selector } from 'packs/recent_payouts'
import { payoutHover } from 'components/navbar'


previewImageOnFileSelect();
cardUnlocked();
turnArrow();
showTransactionDetails();
hoverDetails();
showPayoutCode();
copyLink();
payoutHover();
copyTooltips();
selector();
