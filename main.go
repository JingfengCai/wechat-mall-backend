package main

import (
	"log"
	"wechat-mall-backend/app/interfaces"
	"wechat-mall-backend/pkg/config"
	"wechat-mall-backend/pkg/database"
	"wechat-mall-backend/web"
)

func main() {
	log.SetFlags(log.Lshortfile | log.Ltime | log.Ldate)
	// 初始化基础数据配置
	if err := config.InitConfig(); err != nil {
		log.Fatalf("load config fail: %v" + err.Error())
	}
	s := web.NewServer()
	gormDB := database.NewGormDB()
	service := interfaces.InitializeService(gormDB)
	s.Register(service)
	if err := s.Serve(); err != nil {
		log.Fatal(err)
	}
}
