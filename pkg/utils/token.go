package utils

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/pkg/errors"
	"time"
)

const SecretKey = "123456"

type Payload struct {
	jwt.StandardClaims
	Uid int `json:"uid"`
}

func CreateToken(uid int, exp int) (string, error) {
	claims := &Payload{
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Second * time.Duration(exp)).Unix(),
			Issuer:    "admin",
			NotBefore: time.Now().Unix(),
			IssuedAt:  time.Now().Unix(),
		},
		Uid: uid,
	}
	token, err := jwt.NewWithClaims(jwt.SigningMethodHS256, claims).SignedString([]byte(SecretKey))
	if err != nil {
		return "", errors.New("Token 生成失败")
	}
	return token, nil
}

func ValidateToken(tokenStr string) bool {
	token, err := jwt.ParseWithClaims(tokenStr, &Payload{}, func(token *jwt.Token) (i interface{}, e error) {
		return []byte(SecretKey), nil
	})
	if err != nil {
		return false
	}
	return token.Valid
}

func ParseToken(tokenStr string) (*Payload, error) {
	token, err := jwt.ParseWithClaims(tokenStr, &Payload{}, func(token *jwt.Token) (i interface{}, e error) {
		return []byte(SecretKey), nil
	})
	if err != nil {
		return nil, errors.New("token解析失败")
	}
	if claims, ok := token.Claims.(*Payload); ok && token.Valid {
		return claims, nil
	} else {
		return nil, errors.New("token无效")
	}
}
