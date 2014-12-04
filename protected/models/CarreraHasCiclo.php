<?php

/**
 * This is the model class for table "Carrera_has_Ciclo".
 *
 * The followings are the available columns in table 'Carrera_has_Ciclo':
 * @property integer $Carrera_idCarrera
 * @property integer $Carrera_Facultad_idFacultad
 * @property integer $Ciclo_idCiclo
 *
 * The followings are the available model relations:
 * @property Carrera $carreraIdCarrera
 * @property Carrera $carreraFacultadIdFacultad
 * @property Ciclo $cicloIdCiclo
 */
class CarreraHasCiclo extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Carrera_has_Ciclo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Carrera_idCarrera, Carrera_Facultad_idFacultad, Ciclo_idCiclo', 'required'),
			array('Carrera_idCarrera, Carrera_Facultad_idFacultad, Ciclo_idCiclo', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('Carrera_idCarrera, Carrera_Facultad_idFacultad, Ciclo_idCiclo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'carreraIdCarrera' => array(self::BELONGS_TO, 'Carrera', 'Carrera_idCarrera'),
			'carreraFacultadIdFacultad' => array(self::BELONGS_TO, 'Carrera', 'Carrera_Facultad_idFacultad'),
			'cicloIdCiclo' => array(self::BELONGS_TO, 'Ciclo', 'Ciclo_idCiclo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'Carrera_idCarrera' => 'Carrera Id Carrera',
			'Carrera_Facultad_idFacultad' => 'Carrera Facultad Id Facultad',
			'Ciclo_idCiclo' => 'Ciclo Id Ciclo',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('Carrera_idCarrera',$this->Carrera_idCarrera);
		$criteria->compare('Carrera_Facultad_idFacultad',$this->Carrera_Facultad_idFacultad);
		$criteria->compare('Ciclo_idCiclo',$this->Ciclo_idCiclo);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CarreraHasCiclo the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
