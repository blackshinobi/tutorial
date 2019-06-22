<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "article".
 *
 * @property int $Id
 * @property string $Title
 * @property string $Content
 * @property string $Image
 * @property int $StatId
 * @property string $Remark
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'article';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Content'], 'string'],
            [['StatId'], 'integer'],
            [['Title', 'Image'], 'string', 'max' => 255],
            [['Remark'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'Id' => 'ID',
            'Title' => 'Title',
            'Content' => 'Content',
            'Image' => 'Image',
            'StatId' => 'Stat ID',
            'Remark' => 'Remark',
        ];
    }
}
