import "bootstrap";
import "transition";
import { previewImageOnFileSelect } from 'photo-upload-preview/photo_upload_preview';
import { cardUnlocked } from 'packs/store';
import { statusChange, turnArrow } from 'pages/transaction';

previewImageOnFileSelect();
cardUnlocked();
statusChange();
turnArrow();
