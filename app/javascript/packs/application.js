import "bootstrap";
import "transition";
import { previewImageOnFileSelect } from 'photo-upload-preview/photo_upload_preview';
import { statusChange, turnArrow } from 'pages/transaction';

previewImageOnFileSelect();

statusChange();
turnArrow();
