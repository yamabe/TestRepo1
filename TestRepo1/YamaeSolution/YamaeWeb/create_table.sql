/* ���[�U�[�e�[�u�� */
CREATE TABLE T�ʎY�w�� (
    ������ DATETIME NOT NULL -- ������
  , �@�햼 VARCHAR(100) NOT NULL -- �@�햼
  , �w��No VARCHAR(100) NOT NULL -- �w��No
  , ���i�R�[�h VARCHAR(100) NOT NULL -- ���i�R�[�h
  , �w�ߕ��i VARCHAR(1000) NOT NULL -- �w�ߕ��i
  , �䐔������̎g�p�� INTEGER NOT NULL -- �䐔������̎g�p��
  , ���Ԋ��䐔 INTEGER NOT NULL -- ���Ԋ��䐔
  , �X�e�[�^�X VARCHAR(100) -- �X�e�[�^�X
  , ���Ō����\��� DATETIME -- ���Ō����\���
  , ���Ō������� INTEGER -- ���Ō�������
  , ���Ō��������� DATETIME -- ���Ō���������
  , ���Ō����[�i�� DATETIME -- ���Ō����[�i��
  , ���Ō����m�F�� DATETIME -- ���Ō����m�F��
  , �^�������o�� DATETIME -- �^�������o��
  , ���őg���p�\��� DATETIME -- ���őg���p�\���
  , ���őg���p���� INTEGER -- ���őg���p����
  , ���őg���p������ DATETIME -- ���őg���p������
  , ���őg���p�[�i�� DATETIME -- ���őg���p�[�i��
  , ���őg���\��� DATETIME -- ���őg���\���
  , �ʎ��\��� DATETIME -- �ʎ��\���
  , �ʎY�J�n�\��� DATETIME -- �ʎY�J�n�\���
  , �S���� INTEGER -- �S����
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (�w��No)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE T�P�� (
   �P��ID INTEGER AUTO_INCREMENT NOT NULL -- �P��ID
  , ���i�R�[�h VARCHAR(100) -- ���i�R�[�h
  , ���i���� VARCHAR(100) -- ���i����
  , �ޗ�ID INTEGER -- �ޗ�ID
  , �ޗ����� VARCHAR(100) -- �ޗ�����
  , �ގ��啪�� VARCHAR(100) -- �ގ��啪��
  , �ގ� VARCHAR(100) -- �ގ�
  , ��ڐ��@�c_original DOUBLE -- ��ڐ��@�c
  , ��ڐ��@��_original DOUBLE -- ��ڐ��@��
  , ��ڎd�����z_original DOUBLE -- ��ڎd�����z
  , ��ڐ��@�c DOUBLE -- ��ڐ��@�c
  , ��ڐ��@�� DOUBLE -- ��ڐ��@��
  , ���� DOUBLE -- ����
  , ��ڎd�����z DOUBLE -- ��ڎd�����z
  , ��ڎd�������v�Z�t���O VARCHAR(5) -- ��ڎd�������v�Z
  , ��ڔ�����z DOUBLE -- ��ڔ�����z
  , ���ԒP�� DOUBLE -- ���ԒP��
  , ���P�� DOUBLE -- ���P��
  , �b�P�� DOUBLE -- �b�P��
  , m2������̍ޗ��� DOUBLE -- �ޗ���
  , m2������̎搔���� DOUBLE -- �搔����
  , m2������̎搔�悱 DOUBLE -- �搔�悱
  , m2������̎搔 DOUBLE -- �搔
  , �d����P�� DOUBLE -- �d����P��
  , ���i���� DOUBLE -- ���i����
  , ���i�悱 DOUBLE -- ���i�悱
  , ���Ă��� DOUBLE -- ���Ă���
  , �悱���� DOUBLE -- �悱����
  , ��萔 DOUBLE -- ��萔
  , ����_�ޗ��� DOUBLE -- �ޗ���
  , ����_�ْf DOUBLE -- �ْf
  , ����_�Ŕ� DOUBLE -- �Ŕ�
  , ����_�\�� DOUBLE -- �\��
  , ����_�Ȃ� DOUBLE -- �Ȃ�
  , ����_�d�グ DOUBLE -- �d�グ
  , ����_���X�Ǘ� DOUBLE -- ���X�Ǘ�
  , ����_�ޗ���� DOUBLE -- �ޗ����
  , ����_���H��v DOUBLE -- ���H��v
  , ����_���H��� DOUBLE -- ���H���
  , ����_�P�� DOUBLE -- �P��
  , ����_m2������ޗ��� DOUBLE -- m2������ޗ���
  , ����_���날�� DOUBLE -- ��������
  , �悱_���날�� DOUBLE -- �����悱
  , �c��萔 DOUBLE -- �c��萔
  , ����萔 DOUBLE -- ����萔
  , ���ė] DOUBLE -- ���ė]
  , �悱�] DOUBLE -- �悱�]
  , �v�Z_��萔 DOUBLE -- ��萔
  , �v�Z_�ޗ���T DOUBLE -- �ޗ���T
  , �v�Z_�ޗ��� DOUBLE -- �ޗ���
  , �v�Z_�ْf DOUBLE -- �ْf
  , �v�Z_�Ŕ� DOUBLE -- �Ŕ�
  , �v�Z_�\�� DOUBLE -- �\��
  , �v�Z_�Ȃ� DOUBLE -- �Ȃ�
  , �v�Z_�d�グ DOUBLE -- �d�グ
  , �v�Z_���X�Ǘ� DOUBLE -- ���X�Ǘ�
  , �v�Z_�ޗ���� DOUBLE -- �ޗ����
  , �v�Z_���H��v DOUBLE -- ���H��v
  , �v�Z_���H��� DOUBLE -- ���H���
  , �v�Z_�P�� DOUBLE -- �P��
  , ��ڍْf_�� INTEGER -- ��
  , ��ڍْf_���v���� INTEGER -- ���v����
  , ��ڍْf_���� INTEGER -- ����
  , ���@�J�b�g_�� INTEGER -- ��
  , ���@�J�b�g_���v���� INTEGER -- ���v����
  , ���@�J�b�g_���� INTEGER -- ����
  , �Ŕ�_�^�搔 INTEGER -- �^�搔
  , �Ŕ�_�v���X�� INTEGER -- �v���X��
  , �Ȃ�_�� INTEGER -- ��
  , �Ȃ�_�b�� INTEGER -- �b��
  , �Ȃ�_�������H INTEGER -- �������H
  , �d�グ_�� INTEGER -- ��
  , �d�グ_�b�� INTEGER -- �b��
  , �d�グ_�������H INTEGER -- �������H
  , ���X�Ǘ�_�ޔ� DOUBLE -- �ޔ�
  , ���X�Ǘ�_���H�� DOUBLE -- ���H��
  , ��ڍْf_���� DOUBLE -- ����
  , ��ڍْf_��Ɣ� DOUBLE -- ��Ɣ�
  , ��ڍْf_�P������ DOUBLE -- �P������
  , ���@�J�b�g_���� DOUBLE -- ����
  , ���@�J�b�g_��Ɣ� DOUBLE -- ��Ɣ�
  , ���@�J�b�g_�P������ DOUBLE -- �P������
  , �Ŕ�_���ԓ�����̉��H�� DOUBLE -- ���H��/����
  , �Ŕ�_�P������ DOUBLE -- �P������
  , �Ȃ�_���� DOUBLE -- ����
  , �Ȃ�_��Ɣ� DOUBLE -- ��Ɣ�
  , �Ȃ�_�P������ DOUBLE -- �P������
  , �d�グ_���� DOUBLE -- ����
  , �d�グ_��Ɣ� DOUBLE -- ��Ɣ�
  , �d�グ_�P������ DOUBLE -- �P������
  , ���X�Ǘ�_��_��p DOUBLE -- ��_��p
  , ���X�Ǘ�_���H_��p DOUBLE -- ���H_��p
  , ����_��ڍْf��� DOUBLE -- ����_��ڍْf���
  , �v�Z_��ڍْf��� DOUBLE -- �v�Z_��ڍْf���
  , �v�Z_���@�J�b�g��� DOUBLE -- �v�Z_���@�J�b�g���
  , ����_�Ŕ���� DOUBLE -- ����_�Ŕ����
  , �v�Z_�Ŕ���� DOUBLE -- �v�Z_�Ŕ����
  , ����_�\���� DOUBLE -- ����_�\����
  , �v�Z_�\���� DOUBLE -- �v�Z_�\����
  , ����_�Ȃ���� DOUBLE -- ����_�Ȃ����
  , �v�Z_�Ȃ���� DOUBLE -- �v�Z_�Ȃ����
  , ����_�d�グ��� DOUBLE -- ����_�d�グ���
  , �v�Z_�d�グ��� DOUBLE -- �v�Z_�d�グ���
  , ����_���X�Ǘ���� DOUBLE -- ����_���X�Ǘ����
  , �v�Z_���X�Ǘ���� DOUBLE -- �v�Z_���X�Ǘ����
  , ���b�g INTEGER -- ���b�g
  , �ۂߐ� INTEGER -- �ۂߐ�
  , ���i�d�� DOUBLE -- ���i�d��
  , �}�ʃt�@�C�� VARCHAR(100) -- �}�ʃt�@�C��
  , ���l TEXT -- ���l
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (�P��ID)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE M�ޗ��K�i�ԍ� (
    �ޗ��K�iID INTEGER AUTO_INCREMENT NOT NULL -- �ޗ��K�iID
  , �X�e�[�^�X VARCHAR(100) -- �X�e�[�^�X
  , ���Ӑ� INTEGER -- ���Ӑ�
  , �K�i�ԍ� VARCHAR(100) -- �K�i�ԍ�
  , �ޗ��� VARCHAR(100) -- �ޗ���
  , No VARCHAR(100) -- No
  , ���l TEXT -- ���l
  , �R�b�t���O VARCHAR(5) -- �R�b�t���O
  , �d����� INTEGER -- �d�����
  , �ޗ����[�J�[ INTEGER -- �ޗ����[�J�[
  , �ގ� INTEGER -- �ގ�
  , M�ޗ�_�ޗ�ID INTEGER -- M�ޗ�_�ޗ�ID
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (�ޗ��K�iID)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE M�ޗ����i (
    �ޗ�ID INTEGER AUTO_INCREMENT NOT NULL -- �ޗ�ID
  , �ޗ�����ID INTEGER -- �ޗ�����ID
  , �ޗ����� VARCHAR(100) -- �ޗ�����
  , �ޗ����[�J�[ INTEGER -- �ޗ����[�J�[
  , �ގ��啪�� VARCHAR(100) -- �ގ��啪��
  , �ގ� VARCHAR(100) -- �ގ�
  , ��ڐ��@�c DOUBLE -- ��ڐ��@�c
  , ��ڐ��@�� DOUBLE -- ��ڐ��@��
  , ���� DOUBLE -- ����
  , ���x DOUBLE -- ���x
  , ��ڎd�����z DOUBLE -- ��ڎd�����z
  , m2������ޗ��� DOUBLE -- m2������ޗ���
  , ��ڔ�����z DOUBLE -- ��ڔ�����z
  , ���v�� DOUBLE -- ���v��
  , ���l TEXT -- ���l
  , �L���t���O VARCHAR(5) -- �L���t���O
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (�ޗ�ID)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE M�ޗ����� (
    �ޗ�����ID INTEGER AUTO_INCREMENT NOT NULL -- �ޗ�����ID
  , �ޗ����� VARCHAR(100) -- �ޗ�����
  , �ޗ����[�J�[ INTEGER -- �ޗ����[�J�[
  , �ގ��啪�� VARCHAR(100) -- �ގ��啪��
  , �ގ� VARCHAR(100) -- �ގ�
  , �ϊ� DOUBLE -- �ϊ�
  , �ϔM DOUBLE -- �ϔM
  , ��R�� INTEGER -- ��R��
  , ���l TEXT -- ���l
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (�ޗ�����ID)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE M�R�[�h (
    �R�[�hID INTEGER AUTO_INCREMENT NOT NULL -- �R�[�hID
  , �O���[�v VARCHAR(100) -- �O���[�v
  , ���� VARCHAR(100) -- ����
  , ���� INTEGER -- ����
  , ���l TEXT -- ���l
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (�R�[�hID)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE M���[�U�[ (
    ���[�U�[ID INTEGER AUTO_INCREMENT NOT NULL -- ���[�U�[ID
  , ���[�U�[�� VARCHAR(100) -- ���[�U�[��
  , �p�X���[�h VARCHAR(100) -- �p�X���[�h
  , �z�X�g�� VARCHAR(100) -- �z�X�g��
  , ���l TEXT -- ���l
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (���[�U�[ID)
);
/* ���[�U�[�e�[�u�� */
CREATE TABLE M��� (
    ���ID INTEGER AUTO_INCREMENT NOT NULL -- ���ID
  , ��Ж��� VARCHAR(100) -- ��Ж���
  , ���Ӑ� VARCHAR(5) -- ���Ӑ�
  , �d����� VARCHAR(5) -- �d�����
  , �ޗ����[�J�[ VARCHAR(5) -- �ޗ����[�J�[
  , ����L�� VARCHAR(5) -- ����L��
  , ���l TEXT -- ���l
  , �폜�t���O VARCHAR(5) -- �폜�t���O
  , �쐬���[�U�[ INTEGER -- �쐬���[�U�[
  , �ŏI�X�V���[�U�[ INTEGER -- �ŏI�X�V���[�U�[
  , �쐬���� DATETIME NOT NULL -- �쐬����
  , �ŏI�X�V���� DATETIME NOT NULL -- �ŏI�X�V����
  , PRIMARY KEY (���ID)
);