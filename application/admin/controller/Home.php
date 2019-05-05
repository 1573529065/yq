<?php
namespace app\admin\controller;

use app\admin\exception\AdminException;
use think\Db;
use think\Request;

class Home extends Admin {
    
    //首页-banner管理
    public function banner(){
     $list =  Db::table('banner')->order('sort')->paginate(15);
    
     return $this->render('banner',['list'=>$list]);
    }
      //首页-banner添加
    public function b_add(){
      if(request()->isPost()){
          $data = input('post.');
            $file = request()->file('img');
            if(!$file){
                 $this->error('添加失败', '', '', 1);
            }
            // 移动到框架应用根目录/uploads/ 目录下
            $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads');
            if (!$info)
                $this->error($file->getError(), '', '', 1);
            $img = '/uploads/' . $info->getSaveName();
            $data['img'] = $img;
            $result = Db::table('banner')->insert($data);
            if($result === false){
               $this->error('添加失败', '', '', 1);
            }
             $this->success('添加成功', 'banner', '', 1);
        }
        return $this->render('b_add');
    }
        //首页-banner添加
    public function b_edit(){
      if(request()->isPost()){
          $data = input('post.');
            $file = request()->file('img');
            if($file){
            // 移动到框架应用根目录/uploads/ 目录下
            $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads');
            if (!$info)
                $this->error($file->getError(), '', '', 1);
            $img = '/uploads/' . $info->getSaveName();
            $data['img'] = $img;
             }
            $result = Db::table('banner')->where("id=:id", ['id' => [$data['id'], \PDO::PARAM_INT]])->update($data);
            if($result === false){
               $this->error('修改失败', '', '', 1);
            }
             $this->success('修改成功', 'banner', '', 1);
        }
       $id  = input('get.id');
       $res = Db::table('banner')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->find();
       
        return $this->render('b_edit',['res'=>$res]);
    }
    
    public function b_del(){
      $id = input('get.id');
      if(!empty($id)){
         $res= Db::table('banner')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->delete();
         if($res){
              return json(['code' => 0, 'message' => 'success']);
         }
          return json(['code' => 1, 'message' => '删除失败!']);
      }
        return $this->redirect('banner');
    }
    
    
    public function jianjie(){
     
     $list =  Db::table('jianjie')->order('sort')->paginate(15);
    
     return $this->render('jianjie',['list'=>$list]);
    }
    
    
    public function j_add(){
        if(request()->isPost()){
            $data = input('post.');
            $res = Db::table('jianjie')->insert($data);
            if($res){
                $this->success('添加成功', 'jianjie', '', 1);
            }
             $this->error('添加失败', '', '', 1);
            
        }
         return $this->render('j_add');
    }
    
    //中介担保
    public function inter() {
       $list =  Db::table('inter')->paginate(20);
       return $this->render('inter',['list'=>$list]);
    }
    //中介担保-添加
    public function i_add(){
        if(request()->isPost()){
            $data = input('post.content');
            $data = explode('@', $data);
            foreach ($data as $k => $v) {
                $content[] = ['content'=>$v];
            }
            $res =  Db::table('inter')->insertAll($content);
           if($res){
                $this->success('添加成功', 'inter', '', 1);
           }
           $this->error('添加失败', '', '', 1);
        }
        return $this->render('i_add');
    }
    
   public function i_del(){
      $id = input('get.id');
      if(!empty($id)){
         $res= Db::table('inter')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->delete();
         if($res){
              return json(['code' => 0, 'message' => 'success']);
         }
          return json(['code' => 1, 'message' => '删除失败!']);
      }
        return $this->redirect('inter');
    }
    
    public function give(){
        $list =  Db::table('give')->paginate(15);
        return $this->render('give',['list'=>$list]);
    }
    
    //船员招聘添加
    public function g_add(){
        if(request()->isPost()){
            $data = input('post.');
            if(empty($data['f_time'])){
                $data['f_time'] = date('Y-m-d H:s:i');
            }
          $data['content'] = str_replace(" "," ",str_replace("\n","<br/>",$data['content']));
          $res =  Db::table('give')->insert($data);
           if($res){
                $this->success('添加成功', 'give', '', 1);
           }
           $this->error('添加失败', '', '', 1);
            
        }
        return $this->render('g_add');
    }
    
       public function g_del(){
      $id = input('get.id');
      if(!empty($id)){
         $res= Db::table('give')->where("id=:id", ['id' => [$id, \PDO::PARAM_INT]])->delete();
         if($res){
              return json(['code' => 0, 'message' => 'success']);
         }
          return json(['code' => 1, 'message' => '删除失败!']);
      }
        return $this->redirect('give');
    }
    
}
