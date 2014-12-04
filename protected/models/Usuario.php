<?php

/**
 * This is the model class for table "Usuario".
 *
 * The followings are the available columns in table 'Usuario':
 * @property integer $idUsuario
 * @property string $Nombre
 * @property string $Apellidos
 * @property integer $Puntuacion
 * @property string $NivelEducativo
 * @property string $Carrera
 */
class Usuario extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'Usuario';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Nombre, Apellidos, NivelEducativo', 'required'),
			array('Puntuacion', 'numerical', 'integerOnly'=>true),
			array('Nombre, Apellidos, NivelEducativo, Carrera', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idUsuario, Nombre, Apellidos, Puntuacion, NivelEducativo, Carrera', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idUsuario' => 'Id Usuario',
			'Nombre' => 'Nombre',
			'Apellidos' => 'Apellidos',
			'Puntuacion' => 'Puntuacion',
			'NivelEducativo' => 'Nivel Educativo',
			'Carrera' => 'Carrera',
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

		$criteria->compare('idUsuario',$this->idUsuario);
		$criteria->compare('Nombre',$this->Nombre,true);
		$criteria->compare('Apellidos',$this->Apellidos,true);
		$criteria->compare('Puntuacion',$this->Puntuacion);
		$criteria->compare('NivelEducativo',$this->NivelEducativo,true);
		$criteria->compare('Carrera',$this->Carrera,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Usuario the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
