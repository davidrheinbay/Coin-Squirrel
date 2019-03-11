import "bootstrap";
import "transition";
import { previewImageOnFileSelect } from 'photo-upload-preview/photo_upload_preview';
import { statusChange } from 'pages/transaction';

previewImageOnFileSelect();

statusChange();
