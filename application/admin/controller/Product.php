<?php
namespace app\admin\controller;

use app\admin\exception\AdminException;
use app\common\entity\Product as productModel;
use think\Db;
use think\Request;

class Product extends Admin
{
    /**
     * @power 产品管理|能源发生器列表
     * @rank 3
     */
    public function index(Request $request)
    {
        return $this->render('index', [
            'list' => productModel::order('id desc')->paginate(15)
        ]);
    }

    /**
     * @power 产品管理|能源发生器列表@上架能源发生器
     * @method POST
     */
    public function downShelve($id)
    {
        $entity = $this->checkInfo($id);
        $entity->status = 1;

        if (!$entity->save()) {
            throw new AdminException('上架失败');
        }
        return json(['code' => 0, 'message' => 'success']);
    }

    /**
     * @power 产品管理|能源发生器列表@编辑能源发生器
     */
    public function edit($id)
    {
        $entity = productModel::where('id', $id)->find();
        if (!$entity) {
            $this->error('对象不存在');
        }

        return $this->render('edit', [
            'info' => $entity,
        ]);
    }

    /**
     * @power 产品管理|能源发生器列表@下架能源发生器
     * @method POST
     */
    public function shelve($id)
    {
        $entity = $this->checkInfo($id);
        $entity->status = 0;

        if (!$entity->save()) {
            throw new AdminException('下架失败');
        }
        return json(['code' => 0, 'message' => 'success']);
    }

    private function checkInfo($id)
    {
        $entity = productModel::where('id', $id)->find();
        if (!$entity) {
            throw new AdminException('对象不存在');
        }

        return $entity;
    }

    /**
     * @power 产品管理|能源发生器列表@编辑能源发生器
     */
    public function update(Request $request, $id)
    {
        $entity = $this->checkInfo($id);
        
        $file = request()->file('image_url');
        $file1 = request()->file('image_url_jiu');
        if($file){
             $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
             if (!$info)
                $this->error($file->getError(), '', '', 1);
             $entity->image_url = '/uploads/shop/' . $info->getSaveName();
        }
        if($file1){
             $info1 = $file1->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
             if (!$info1)
                $this->error($file1->getError(), '', '', 1);
             $entity->image_url_jiu = '/uploads/shop/' . $info1->getSaveName();
        }
        // 移动到框架应用根目录/uploads/ 目录下
        $entity->product_name = $request->post('product_name');
        $entity->rate_min = $request->post('rate_min');
        $entity->rate_max = $request->post('rate_max');
        $entity->yield_min = $request->post('yield_min');
        $entity->yield_max = $request->post('yield_max');
        $entity->yield_min_display = $request->post('yield_min_display');
        $entity->yield_max_display = $request->post('yield_max_display');
        $entity->price = $request->post('price');
        $entity->period = $request->post('period');
        $entity->jewel_price = $request->post('jewel_price');
        $entity->sort = $request->post('sort')?$request->post('sort'):1;
        $entity->level = $request->post('level')?$request->post('level'):0;
        if ($entity->save() === false) {
           $this->error('保存失败'); 
//           throw new AdminException('保存失败');
        }
         $this->success('保存成功','index');
    }
    
    
    
    public function add(Request $request){
        
        if(request()->isPost()){
           $entity = new productModel();
           $file = request()->file('image_url');
           $file1 = request()->file('image_url_jiu');
           if($file){
                $info = $file->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
                if (!$info)
                   $this->error($file->getError(), '', '', 1);
                $entity->image_url = '/uploads/shop/' . $info->getSaveName();
           }
           if($file1){
                $info1 = $file1->validate(['size' => 1024 * 1024 * 5, 'ext' => 'jpg,png,gif'])->move('../public/uploads/shop');
                if (!$info1)
                   $this->error($file1->getError(), '', '', 1);
                $entity->image_url_jiu = '/uploads/shop/' . $info1->getSaveName();
           }
           // 移动到框架应用根目录/uploads/ 目录下
           $entity->product_name = $request->post('product_name');
           $entity->rate_min = $request->post('rate_min');
           $entity->rate_max = $request->post('rate_max');
           $entity->yield_min = $request->post('yield_min');
           $entity->yield_max = $request->post('yield_max');
           $entity->yield_min_display = $request->post('yield_min_display');
           $entity->yield_max_display = $request->post('yield_max_display');
           $entity->price = $request->post('price');
           $entity->period = $request->post('period');
           $entity->sort = $request->post('sort')?$request->post('sort'):1;
           $entity->level = $request->post('level')?$request->post('level'):0;
           $entity->jewel_price = $request->post('jewel_price');

           if ($entity->save() === false) {
              $this->error('保存失败'); 
   //           throw new AdminException('保存失败');
           }
            $this->success('保存成功','index');
        }
        
        return $this->render('add');
    }
}