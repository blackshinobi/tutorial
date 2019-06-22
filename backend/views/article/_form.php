<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use marqu3s\summernote\Summernote;
?>

<div class="article-form">

    <?php $form = ActiveForm::begin(); ?>


    <?= $form->field($model, 'Title')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'Content')->widget(Summernote::className(), [
            'clientOptions' => ['placeHolder' => 'Tulis posting ...']
        ])->label(false) ?>

    
    <?= $form->field($model, 'Image')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'StatId')->textInput() ?>

    <?= $form->field($model, 'Remark')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
