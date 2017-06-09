--liquibase formatted SQL

--changeset gavin:1
DROP TABLE IF EXISTS `POINT`;
CREATE TABLE `POINT` (
  `ID`                CHAR(36)       NOT NULL,
  `USER_ID`           CHAR(36)       NOT NULL,
  `AMOUNT`            DECIMAL(10, 0) NOT NULL,
  `LOCK_FOR_ORDER_ID` CHAR(36)                DEFAULT NULL,
  `EXPIRE_DATE`       CHAR(10)       NOT NULL,
  `VERSION`           BIGINT(20)              DEFAULT NULL,
  `CREATED_TIME`      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_TIME`     TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `POINT_ID_UINDEX` (`ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS `POINT_HISTORY`;
CREATE TABLE `POINT_HISTORY` (
  `ID`           CHAR(36)       NOT NULL,
  `USER_ID`      CHAR(36)       NOT NULL,
  `ORDER_ID`     CHAR(36)                DEFAULT NULL,
  `AMOUNT`       DECIMAL(10, 0) NOT NULL,
  `ACTION`       VARCHAR(20)    NOT NULL,
  `VERSION`      BIGINT(20)              DEFAULT NULL,
  `CREATED_TIME` TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `POINT_HISTORY_ID_UINDEX` (`ID`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;