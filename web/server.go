package web

import (
	"fmt"
	"net/http"
	"wechat-mall-backend/app/interfaces"
	"wechat-mall-backend/pkg/config"
	"wechat-mall-backend/pkg/log"
)

type Server struct {
	name   string
	addr   string
	router *Router
}

func NewServer() *Server {
	// 加载配置
	serverCfg := config.GlobalConfig().Server
	return &Server{
		name:   serverCfg.Name,
		addr:   fmt.Sprintf("%s:%d", serverCfg.Addr, serverCfg.Port),
		router: NewRouter(),
	}
}

func (s *Server) Register(services *interfaces.MallHttpServiceImpl) {
	s.router.registerHandler(services)
}

func (s *Server) Serve() error {
	log.Debugf("%s runs on http://%s", s.name, s.addr)
	return http.ListenAndServe(s.addr, s.router)
}
