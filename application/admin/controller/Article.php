<?php
namespace app\admin\controller;

use app\admin\exception\AdminException;
use think\Db;
use think\Request;

class Article extends Admin
{
    /**
     * @power 内容管理|文章管理
     * @rank 5
     */
    public function index(Request $request)
    {
        $entity = \app\common\entity\Article::field('*');
        if ($cate = $request->get('cate')) {
            $entity->where('category', $cate);
            $map['cate'] = $cate;
        }

        $list = $entity->paginate(15, false, [
            'query' => isset($map) ? $map : ''
        ]);

        return $this->render('index', [
            'list' => $list,
            'cate' => \app\common\entity\Article::getAllCate()
        ]);
    }

    /**
     * @power 内容管理|文章管理@添加文章
     */
    public function create()
    {
        return $this->render('edit',[
            'cate' => \app\common\entity\Article::getAllCate()
        ]);
    }

    /**
     * @power 内容管理|文章管理@编辑文章
     */
    public function edit($id)
    {
        $entity = \app\common\entity\Article::where('article_id', $id)->find();
        if (!$entity) {
            $this->error('用户对象不存在');
        }

        return $this->render('edit', [
            'info' => $entity,
            'cate' => \app\common\entity\Article::getAllCate()
        ]);
    }

    /**
     * @power 内容管理|文章管理@添加文章
     */
    public function save(Request $request)
    {
        $res = $this->validate($request->post(), 'app\admin\validate\Article');

        if (true !== $res) {
            return json()->data(['code' => 1, 'message' => $res]);
        }

        $service = new \app\common\entity\Article();
        $result = $service->addArticle($request->post());

        if (!$result) {
            throw new AdminException('保存失败');
        }

        return json(['code' => 0, 'toUrl' => url('/admin/article')]);
    }

    /**
     * @power 内容管理|文章管理@编辑文章
     */
    public function update(Request $request, $id)
    {

        $res = $this->validate($request->post(), 'app\admin\validate\Article');

        if (true !== $res) {
            return json()->data(['code' => 1, 'message' => $res]);
        }


        $entity = $this->checkInfo($id);

        $service = new \app\common\entity\Article();
        $result = $service->updateArticle($entity, $request->post());

        if (!$result) {
            throw new AdminException('保存失败');
        }

        return json(['code' => 0, 'toUrl' => url('/admin/article')]);

    }

    /**
     * @power 内容管理|文章管理@删除文章
     */
    public function delete(Request $request, $id)
    {
        $entity = $this->checkInfo($id);

        if (!$entity->delete()) {
            throw new AdminException('删除失败');
        }

        return json(['code' => 0, 'message' => 'success']);

    }

    private function checkInfo($id)
    {
        $entity = \app\common\entity\Article::where('article_id', $id)->find();
        if (!$entity) {
            throw new AdminException('对象不存在');
        }

        return $entity;
    }


    /**
     * @power 内容管理|反馈列表
     * @method GET
     */
    public function messageList(Request $request) {
        $entity = \app\common\entity\Message::field('m.*,u.nick_name,u.mobile')->alias('m');
        if ($keyword = $request->get('keyword')) {
            $type = $request->get('type');
            switch ($type) {
                case 'mobile':
                    $entity->where('u.mobile', $keyword);
                    break;
                case 'nick_name':
                    $entity->where('u.nick_name', $keyword);
                    break;
            }
            $map['type'] = $type;
            $map['keyword'] = $keyword;
        }
        
        $list = $entity->join("user u", 'm.user_id = u.id')
                ->order('m.create_time desc')
                ->paginate(15);
        return $this->render('messageList', [
                    'list' => $list,
        ]);
    }

    /**
     * @power 内容管理|反馈列表@删除留言
     * @method GET
     */
    public function deleteMsg(Request $request)
    {
        $entity = \app\common\entity\Message::where("message_id", $request->get("id"))->delete();
        return json(['code' => 0, 'toUrl' => url('/admin/article/messageList')]);
    }
    
    /*
    * 内容管理|反馈列表@回复
    */
    public function reply() {
        $data = input('post.');
        if (empty($data)) {
            return json(['code' => 500, 'msg' => 'error']);
        }
        $re = \app\common\entity\Message::where("message_id = {$data['message_id']}")->update(['remark'=>$data['remark']]);
        if ($re)
            return json(['code' => 200, 'msg' => '回复成功']);
        return json(['code' => 501, 'msg' => '回复失败']);
    }
    
    
    public function banner(){
       $list = \app\common\entity\Banner::select();
       return $this->render('banner', [
                    'list' => $list,
        ]);
    }
    
    public function bannerEdit(){
        $id = input('id');
        if(request()->isPost()){
            $file = request()->file('img');
            // 移动到框架应用根目录/uploads/ 目录下
            $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
            if (!$info)
                $this->error($file->getError(), '', '', 1);
            $img = '/uploads/shop/' . $info->getSaveName();
            $result = \app\common\entity\Banner::where('id',$id)->update(['img'=>$img]);
            if($result === false){
               $this->error('修改失败', '', '', 1);
            }
             $this->success('修改成功', 'banner', '', 1);
            
        }
        
        return $this->render('bannerEdit',['id'=>$id]);
    }
}